# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = C:/intelFPGA/23.1std/riscfree/build_tools/cmake/bin/cmake.exe

# The command to remove a file.
RM = C:/intelFPGA/23.1std/riscfree/build_tools/cmake/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:/Users/f_off/Desktop/quartusprojects/software/app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:/Users/f_off/Desktop/quartusprojects/software/app/build/Debug

# Utility rule file for niosv-stack-report.

# Include any custom commands dependencies for this target.
include CMakeFiles/niosv-stack-report.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/niosv-stack-report.dir/progress.make

CMakeFiles/niosv-stack-report: app.elf.stack_report

app.elf.stack_report: app.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=C:/Users/f_off/Desktop/quartusprojects/software/app/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Reporting memory available for stack + heap in app.elf."
	niosv-stack-report -p riscv32-unknown-elf- app.elf

niosv-stack-report: CMakeFiles/niosv-stack-report
niosv-stack-report: app.elf.stack_report
niosv-stack-report: CMakeFiles/niosv-stack-report.dir/build.make
.PHONY : niosv-stack-report

# Rule to build all files generated by this target.
CMakeFiles/niosv-stack-report.dir/build: niosv-stack-report
.PHONY : CMakeFiles/niosv-stack-report.dir/build

CMakeFiles/niosv-stack-report.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/niosv-stack-report.dir/cmake_clean.cmake
.PHONY : CMakeFiles/niosv-stack-report.dir/clean

CMakeFiles/niosv-stack-report.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/f_off/Desktop/quartusprojects/software/app C:/Users/f_off/Desktop/quartusprojects/software/app C:/Users/f_off/Desktop/quartusprojects/software/app/build/Debug C:/Users/f_off/Desktop/quartusprojects/software/app/build/Debug C:/Users/f_off/Desktop/quartusprojects/software/app/build/Debug/CMakeFiles/niosv-stack-report.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/niosv-stack-report.dir/depend

