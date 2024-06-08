// Example Verilog testbench
module testcode;
    reg clk;
    reg reset_n;

    // Instantiate the top-level design
    top_level_design uut (
        .clk(clk),
        .reset_n(reset_n)
        // Connect other necessary signals
    );

    // Clock generation
    initial begin
        clk = 0;
        // Generate clock for a specific number of cycles
        repeat (500) begin
            #5 clk = ~clk;
        end
    end

    // Reset generation
    initial begin
        reset_n = 0;
        #20 reset_n = 1;
    end

    // Simulation end
    initial begin
        #1000 $stop;
    end
endmodule
