#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
clock_t start, end;
clock_t start2, end2;
double cpu_time_used2;
double cpu_time_used;
#define MAX_SAMPLES 3600
#define FILTER_LENGTH 12 // Longueur du filtre de reconstruction

#define MAX_SAMPLES_PLUS_FILTER (MAX_SAMPLES + FILTER_LENGTH)
#define MAX_SIGNAL_LENGTH 2000 // Taille maximale du signal d'entrée
#define MAX_UPSAMPLED_LENGTH (2 * MAX_SIGNAL_LENGTH) // Taille maximale du signal suréchantillonné
#define OUTPUT_DIRECTORY "C:\\Users\\f_off\\Desktop\\quartusprojects\\software\\"

typedef struct {
    double x_MLII_;
} ECGData;

int readECGDataFromCSV(const char* filename, ECGData data[], int maxSamples) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        printf("Failed to open the file\n");
        return -1;
    }

    char line[100];
    fgets(line, sizeof(line), file);
    fgets(line, sizeof(line), file);

    int i = 0;
    while (i < maxSamples && fgets(line, sizeof(line), file) != NULL) {
        sscanf(line, "%*[^,], %lf", &data[i].x_MLII_);
        i++;
    }

    fclose(file);
    return i;
}

void createModifiedSignal(double *originalSignal, double *modifiedSignal, int numSamples, int prependLength) {
    // Ajouter les 'prependLength' premiers échantillons au début du signal modifié.
    for (int i = 0; i < prependLength; i++) {
        modifiedSignal[i] = originalSignal[i];
    }
    // Ajouter le reste du signal original.
    for (int i = 0; i < numSamples; i++) {
        modifiedSignal[i + prependLength] = originalSignal[i];
    }
}

#define OUTPUT_DIRECTORY "/mnt/sim_files/"

void saveToCSV(const char* filename, double *array, int length) {
    char filePath[256];
    snprintf(filePath, sizeof(filePath), "%s%s", OUTPUT_DIRECTORY, filename);

    FILE *file = fopen(filePath, "w");
    if (!file) {
        printf("Failed to open the file\n");
        return;
    }

    for (int i = 0; i < length; i++) {
        fprintf(file, "%lf\n", array[i]);
    }

    fclose(file);
}

void performDWT(double *signal, int signalLength, double *Lo_D, double *Hi_D, int filterLength, double *A, double *D) {
    // Taille des nouveaux signaux après la DWT
    int newLength = (signalLength + filterLength - 1) / 2;

    for (int i = 0; i < newLength; i++) {
        A[i] = 0.0;
        D[i] = 0.0;
        for (int j = 0; j < filterLength; j++) {
            int k = 2 * i - j;
            if (k >= 0 && k < signalLength) {
                A[i] += signal[k] * Lo_D[j];
                D[i] += signal[k] * Hi_D[j];
            }
        }
    }
}

void performSingleLevelReconstruction(double *A, int signalLength, double *Lo_R, double *reconstructedSignal) {
    double upsampled_A[MAX_UPSAMPLED_LENGTH]; // Signal suréchantillonné (statique)

    // Insertion de zéros entre les coefficients pour suréchantillonnage
    for (int i = 0; i < signalLength; i++) {
        upsampled_A[2 * i] = A[i];
    }

    // Reconstruction du signal
    for (int i = 0; i < 2 * signalLength; i++) {
        reconstructedSignal[i] = 0.0;
        for (int j = 0; j < FILTER_LENGTH; j++) {
            int k = i - j;
            if (k >= 0 && k < 2 * signalLength) {
                reconstructedSignal[i] += upsampled_A[k] * Lo_R[j];
            }
        }
    }
}



void applyADTF(double *signal, int length, double b, int m, double *filteredSignal) {
    int start_idx, end_idx;
    double g, Mx, Mi, Ht, Lt;

    for (int i = 0; i < length; i++) {
        start_idx = (i - m / 2 > 0) ? i - m / 2 : 0;
        end_idx = (i + m / 2 < length) ? i + m / 2 : length - 1;

        // Initialize variables for computing the mean, max, and min of the window
        g = 0;
        Mx = signal[start_idx];  // max value within the window
        Mi = signal[start_idx];  // min value within the window
        for (int j = start_idx; j <= end_idx; j++) {
            g += signal[j];
            if (signal[j] > Mx) Mx = signal[j];
            if (signal[j] < Mi) Mi = signal[j];
        }
        g /= (end_idx - start_idx + 1); // Calculate mean of window
        Ht = g + b * (Mx - g);   // High threshold
        Lt = g - b * (g - Mi);  // low threshold

        // Apply thresholds

        if (signal[i] > Ht) {
            filteredSignal[i] = Ht;
        } else if (signal[i] < Lt) {
            filteredSignal[i] = Lt;
        } else {
            filteredSignal[i] = signal[i];
        }
    } //
}


void correctHighestPeaks(double *finalSignal, double *adtfSignal, double *correctedSignal, int length, double threshold) {
    double peakThreshold = threshold;
    int correctionRadius = 10; // Example radius around each peak for correction

    // Copy the entire ADTF signal into the correctedSignal as a baseline
    memcpy(correctedSignal, adtfSignal, length * sizeof(double));

    // Iterate through the finalSignal to find and correct peaks
    for (int i = 0; i < length; ++i) {
        if (fabs(finalSignal[i]) > peakThreshold) {
            // Identified a peak exceeding the threshold
            int start = i - correctionRadius >= 0 ? i - correctionRadius : 0;
            int end = i + correctionRadius < length ? i + correctionRadius : length - 1;

            // Replace the segment around the peak in correctedSignal with values from the finalSignal
            for (int j = start; j <= end; ++j) {
                correctedSignal[j] = finalSignal[j];
            }
        }
    }
}




// Function to add Gaussian noise to a signal
void addGaussianNoise(double *signal, int length, double snr) {
    double signalPower = 0;
    for (int i = 0; i < length; i++) {
        signalPower += signal[i] * signal[i];
    }
    signalPower /= length;

    double noisePower = signalPower / pow(10.0, snr / 10.0);
    double stddev = sqrt(noisePower);
    srand(time(NULL)); // Seed random number generator

    for (int i = 0; i < length; i++) {
        double noise = stddev * ((rand() / (double)RAND_MAX) * 2 - 1);
        signal[i] += noise;
    }
}




double calculatePRD(const double *original, const double *processed, int numSamples){
    double sumSquaredDiff = 0.0, sumSquaredOriginal = 0.0;
    for (int i = 0; i < numSamples ; i++) {
        double diff = original[i] - processed[i];
        sumSquaredDiff += diff * diff;
        sumSquaredOriginal += original[i] * original[i];
    }
    return 100.0 * (sqrt(sumSquaredDiff) / sqrt(sumSquaredOriginal));
}

double calculateSNRout(const double *original, const double *processed, int numSamples) {
    double sumSquaredOriginal = 0.0, sumSquaredDiff = 0.0;
    for (int i = 0; i < numSamples ; i++) {
        double diff = processed[i]  - original[i]  ;
        sumSquaredOriginal += original[i] * original[i];
        sumSquaredDiff += diff * diff;
    }
    return 10.0 * log10(sumSquaredOriginal / sumSquaredDiff);
}

double calculateSNRimp(const double *original, const double *noise, const double *corrected, int numSamples) {
    double sumSquaredNoise = 0.0, sumSquaredDiff = 0.0;
    for (int i = 0; i < numSamples ; i++) {
        double diff = corrected[i] - original[i];
        double noiseDiff = noise[i] - original[i]; // Ici on utilise le bruit original
        sumSquaredNoise += noiseDiff * noiseDiff;
        sumSquaredDiff += diff * diff;
    }
    return 10.0 * log10(sumSquaredNoise / sumSquaredDiff);
}


double calculateMSE(const double *actual, const double *predicted, int numSamples) { double sumSquaredError = 0.0;
    for (int i = 0; i < numSamples; i++) {
        double error = actual[i] - predicted[i];
        sumSquaredError += error * error;
    }
    return sumSquaredError / numSamples;
}

void removeFirstSamples(double *originalSignal, double *modifiedSignal, int numSamples, int removeLength) {
    // Copier le signal original en supprimant les 'removeLength' premiers échantillons.
    for (int i = 0; i < numSamples - removeLength; i++) {
        modifiedSignal[i] = originalSignal[i + removeLength];
    }
}


void decalerGauche( double signal[], int taille, int nbDecalages) {
    for (int j = 0; j < nbDecalages; j++) {
        for (int i = 0; i < taille - 1; i++) {
            signal[i] = signal[i + 1];
        }
        signal[taille - 1] = 0;
    }
}



int main() {

     start2 = clock();
   ECGData dataTable[MAX_SAMPLES];
    double ecgData[MAX_SAMPLES];
    double ecgoriginal[MAX_SAMPLES];
    double modifiedECGData[3708];
    double modifiedECGData2[3708];
    double modifiedECGData3[3708];
    double modifiedECGData4[3708];


    int numSamples = readECGDataFromCSV("101min.csv", dataTable, MAX_SAMPLES);


    // Convertir les données de la structure en tableau de doubles pour manipulation.
    for (int i = 0; i < numSamples; i++) {
        ecgData[i] = dataTable[i].x_MLII_;
                ecgoriginal[i] = dataTable[i].x_MLII_;

    }
    saveToCSV("ecg.csv", ecgData, numSamples );


    addGaussianNoise(ecgData, numSamples, 5);  // Adding 5 dB SNR



    saveToCSV("noisedecgg.csv", ecgData, numSamples );


    // Define the DWT filters
    double Lo_D[] = {-0.0011, 0.0048, 0.0006, -0.0316, 0.0275, 0.0975, -0.1298, -0.2263, 0.3153, 0.7511, 0.4946, 0.1115};
    double Hi_D[] = {-0.1115, 0.4946, -0.7511, 0.3153, 0.2263, -0.1298, -0.0975, 0.0275, 0.0316, 0.0006, -0.0048, -0.0011};
    double Lo_R[] = {0.1115, 0.4946, 0.7511, 0.3153, -0.2263, -0.1298, 0.0975, 0.0275, -0.0316, 0.0006, 0.0048, -0.0011};
    double Hi_R[] = {-0.0011, -0.0048, 0.0006, 0.0316, 0.0275, -0.0975, -0.1298, 0.2263, 0.3153, -0.7511, 0.4946, -0.1115};

    // Allocate memory for DWT outputs
    double A1[(numSamples + FILTER_LENGTH - 1) / 2], D1[(numSamples + FILTER_LENGTH - 1) / 2], A2[((numSamples + FILTER_LENGTH - 1)/ 2 + FILTER_LENGTH - 1) / 2], D2[((numSamples + FILTER_LENGTH - 1)/ 2 + FILTER_LENGTH - 1) / 2];

    // Créer le signal modifié en répétant les premiers 12 échantillons.
    createModifiedSignal(ecgData, modifiedECGData, numSamples, 11);



    // Perform two-level DWT
    saveToCSV("modified_ecg.csv", modifiedECGData, numSamples + 11);


    performDWT(modifiedECGData, numSamples+ 11, Lo_D, Hi_D, FILTER_LENGTH, A1, D1); // First level DWT

    saveToCSV("A1.csv", A1, (numSamples + 11)/2);
   // Créer le signal modifié en répétant les premiers 12 échantillons.
    createModifiedSignal(A1, modifiedECGData2, (numSamples+11)/2, 11);

    saveToCSV("MA1.csv", modifiedECGData2, (numSamples + 11)/2 +11);

    start = clock();
    for (int i = 0; i < 20; i++) {

    performDWT(modifiedECGData2, ((numSamples+11)/2 ) + 11, Lo_D, Hi_D, FILTER_LENGTH, A2, D2); // Second level DWT
    }
end = clock();
cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
cpu_time_used /= 20; // Average time per call

printf("Temps d'execution de performDWT: %f secondes\n", cpu_time_used);



    saveToCSV("A2.csv", A2, ((numSamples + 11)/2 +11 ) /2);

    // Allocate memory for intermediate and final reconstructed signals
    double intermediateSignal[ 3708 ]; // After first reconstruction
    double finalSignal[3708]; // Assuming MAX_SAMPLES is the length of your ECG data
    double finalSignal2 [3708];

    //createModifiedSignal(A2, modifiedECGData3, (((numSamples+11)/2 ) + 11)/2, 11);

    //saveToCSV("MA2.csv", modifiedECGData3, (((numSamples+11)/2 ) + 11)/2 +11 );
    removeFirstSamples(A2, modifiedECGData3, ((numSamples + 11)/2 +11 ) /2 , 11);




    // First level of reconstruction
    start = clock();
    for (int i = 0; i < 50; i++) {
    performSingleLevelReconstruction(modifiedECGData3, ((numSamples + 11)/2 +11 ) /2 - 11 , Lo_R, intermediateSignal);
    }

end = clock();
cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
cpu_time_used /= 50; // Average time per call

printf("Temps d'execution de performSingleLevelReconstruction : %f secondes\n", cpu_time_used);




saveToCSV("R1A2.csv", intermediateSignal, (((numSamples + 11)/2 +11 ) /2 - 11)*2 );

    //createModifiedSignal(intermediateSignal, modifiedECGData4, ((((numSamples+11)/2 ) + 11)/2   +11)*2 , 11);
    //saveToCSV("MR1A2.csv", modifiedECGData4, ((((numSamples+11)/2 ) + 11)/2   +11)*2 + 11  );
    removeFirstSamples(intermediateSignal, modifiedECGData4, (((numSamples + 11)/2 +11 ) /2 - 11)*2 , 11);

    // Second level of reconstruction, acts on the result of the first reconstruction
    performSingleLevelReconstruction(modifiedECGData4, (((numSamples + 11)/2 +11 ) /2 - 11)*2 -11  , Lo_R, finalSignal);

    saveToCSV("myrec.csv", finalSignal,numSamples );


    int m = 10; // Window length for ADTF
    double b = 0.1; // ADTF thresholding coefficient
    double ecgData_filtered[numSamples]; // Assuming MAX_SAMPLES is the length of your ECG data

    start = clock();

for (int i = 0; i < 50; i++) {

    applyADTF(finalSignal, numSamples, b, m, ecgData_filtered);
}

end = clock();
cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
cpu_time_used /= 50; // Average time per call
printf("Temps d'execution de applyADTF : %f secondes\n", cpu_time_used);




    // Correction of the highest peaks
double Y[3708]; // Array to store the final result after peaks correction
memcpy(Y, ecgData_filtered, numSamples * sizeof(double)); // Copy filtered data to Y for peak correction

    double threshold =0.7;

start = clock();
for (int i = 0; i < 50; i++) {
    correctHighestPeaks(finalSignal, ecgData_filtered, Y, numSamples, threshold);
}
end = clock();
cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
cpu_time_used /= 50; // Average time per call
printf("Temps d'execution de correctHighestPeaks: %f secondes\n", cpu_time_used);


    // Save results to CSV files
    saveToCSV("QA1.csv", A1, (numSamples +11) / 2);
    saveToCSV("QD1.csv", D1, numSamples / 2);
    saveToCSV("QA2.csv", A2, (numSamples / 2 + FILTER_LENGTH - 1) / 2); // Corrected length calculation
    saveToCSV("QD2.csv", D2, (numSamples / 2 + FILTER_LENGTH - 1) / 2); // Corrected length calculation
    saveToCSV("Qrecofsig.csv", finalSignal, (((numSamples + 11)/2 +11 ) /2 - 11)*4 -11);
    saveToCSV("QnoisyECGData.csv", ecgData, (((numSamples + 11)/2 +11 ) /2 - 11)*4 -11);
    saveToCSV("Qfiltred.csv", ecgData_filtered, (((numSamples + 11)/2 +11 ) /2 - 11)*4 -11);
    saveToCSV("QQcorrected.csv", Y, numSamples);


    double mse = calculateMSE(ecgoriginal, Y, numSamples );
    double PRD = calculatePRD(ecgoriginal, Y, numSamples);
    double SNRout = calculateSNRout(ecgoriginal, Y, numSamples);
    double SNRimp = calculateSNRimp(ecgoriginal, ecgData, Y, numSamples);
    double rmse;
   rmse = sqrt(mse);



int longueur_signal = sizeof(finalSignal) / sizeof(finalSignal[0]);

    // Affichage de la longueur du signal
    printf("Longueur du signal original  : %d\n", longueur_signal);
end2 = clock();
cpu_time_used2 = ((double) (end2 - start2)) / CLOCKS_PER_SEC;
printf("Temps d'execution de total: %f secondes\n", cpu_time_used2);
    return 0;

}
