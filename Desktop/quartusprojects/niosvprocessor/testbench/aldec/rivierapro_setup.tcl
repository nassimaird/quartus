
# (C) 2001-2024 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 23.1 991 win32 2024.06.08.01:52:19
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     niosvprocessor_tb
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "aldec.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/aldec/rivierapro_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog -sv2k5 <your compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If niosvprocessor_tb is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "niosvprocessor_tb"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/intelfpga/23.1std/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/csr_mlab.mif ./
  file copy -force $QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/debug_rom.mif ./
  file copy -force $QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/fp32_sqrt_memoryC0_uid62_sqrtTables_lutmem.hex ./
  file copy -force $QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/fp32_sqrt_memoryC1_uid65_sqrtTables_lutmem.hex ./
  file copy -force $QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/fp32_sqrt_memoryC2_uid68_sqrtTables_lutmem.hex ./
  file copy -force $QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_sram.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                       ./libraries/altera_ver           
vmap       altera_ver            ./libraries/altera_ver           
ensure_lib                       ./libraries/lpm_ver              
vmap       lpm_ver               ./libraries/lpm_ver              
ensure_lib                       ./libraries/sgate_ver            
vmap       sgate_ver             ./libraries/sgate_ver            
ensure_lib                       ./libraries/altera_mf_ver        
vmap       altera_mf_ver         ./libraries/altera_mf_ver        
ensure_lib                       ./libraries/altera_lnsim_ver     
vmap       altera_lnsim_ver      ./libraries/altera_lnsim_ver     
ensure_lib                       ./libraries/cyclonev_ver         
vmap       cyclonev_ver          ./libraries/cyclonev_ver         
ensure_lib                       ./libraries/cyclonev_hssi_ver    
vmap       cyclonev_hssi_ver     ./libraries/cyclonev_hssi_ver    
ensure_lib                       ./libraries/cyclonev_pcie_hip_ver
vmap       cyclonev_pcie_hip_ver ./libraries/cyclonev_pcie_hip_ver
ensure_lib                                               ./libraries/altera_common_sv_packages                    
vmap       altera_common_sv_packages                     ./libraries/altera_common_sv_packages                    
ensure_lib                                               ./libraries/error_adapter_0                              
vmap       error_adapter_0                               ./libraries/error_adapter_0                              
ensure_lib                                               ./libraries/avalon_st_adapter                            
vmap       avalon_st_adapter                             ./libraries/avalon_st_adapter                            
ensure_lib                                               ./libraries/rsp_mux_002                                  
vmap       rsp_mux_002                                   ./libraries/rsp_mux_002                                  
ensure_lib                                               ./libraries/rsp_mux                                      
vmap       rsp_mux                                       ./libraries/rsp_mux                                      
ensure_lib                                               ./libraries/rsp_demux                                    
vmap       rsp_demux                                     ./libraries/rsp_demux                                    
ensure_lib                                               ./libraries/cmd_mux_001                                  
vmap       cmd_mux_001                                   ./libraries/cmd_mux_001                                  
ensure_lib                                               ./libraries/cmd_mux                                      
vmap       cmd_mux                                       ./libraries/cmd_mux                                      
ensure_lib                                               ./libraries/cmd_demux_002                                
vmap       cmd_demux_002                                 ./libraries/cmd_demux_002                                
ensure_lib                                               ./libraries/cmd_demux                                    
vmap       cmd_demux                                     ./libraries/cmd_demux                                    
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_burst_adapter         
vmap       jtag_avalon_jtag_slave_burst_adapter          ./libraries/jtag_avalon_jtag_slave_burst_adapter         
ensure_lib                                               ./libraries/niosvprocessor_instruction_manager_wr_limiter
vmap       niosvprocessor_instruction_manager_wr_limiter ./libraries/niosvprocessor_instruction_manager_wr_limiter
ensure_lib                                               ./libraries/router_005                                   
vmap       router_005                                    ./libraries/router_005                                   
ensure_lib                                               ./libraries/router_004                                   
vmap       router_004                                    ./libraries/router_004                                   
ensure_lib                                               ./libraries/router_002                                   
vmap       router_002                                    ./libraries/router_002                                   
ensure_lib                                               ./libraries/router                                       
vmap       router                                        ./libraries/router                                       
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_agent_rsp_fifo        
vmap       jtag_avalon_jtag_slave_agent_rsp_fifo         ./libraries/jtag_avalon_jtag_slave_agent_rsp_fifo        
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_agent                 
vmap       jtag_avalon_jtag_slave_agent                  ./libraries/jtag_avalon_jtag_slave_agent                 
ensure_lib                                               ./libraries/niosvprocessor_data_manager_agent            
vmap       niosvprocessor_data_manager_agent             ./libraries/niosvprocessor_data_manager_agent            
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_translator            
vmap       jtag_avalon_jtag_slave_translator             ./libraries/jtag_avalon_jtag_slave_translator            
ensure_lib                                               ./libraries/niosvprocessor_data_manager_translator       
vmap       niosvprocessor_data_manager_translator        ./libraries/niosvprocessor_data_manager_translator       
ensure_lib                                               ./libraries/irq_mapper                                   
vmap       irq_mapper                                    ./libraries/irq_mapper                                   
ensure_lib                                               ./libraries/dbg_mod                                      
vmap       dbg_mod                                       ./libraries/dbg_mod                                      
ensure_lib                                               ./libraries/timer_module                                 
vmap       timer_module                                  ./libraries/timer_module                                 
ensure_lib                                               ./libraries/hart                                         
vmap       hart                                          ./libraries/hart                                         
ensure_lib                                               ./libraries/rst_controller                               
vmap       rst_controller                                ./libraries/rst_controller                               
ensure_lib                                               ./libraries/mm_interconnect_0                            
vmap       mm_interconnect_0                             ./libraries/mm_interconnect_0                            
ensure_lib                                               ./libraries/sram                                         
vmap       sram                                          ./libraries/sram                                         
ensure_lib                                               ./libraries/niosvprocessor                               
vmap       niosvprocessor                                ./libraries/niosvprocessor                               
ensure_lib                                               ./libraries/jtag                                         
vmap       jtag                                          ./libraries/jtag                                         
ensure_lib                                               ./libraries/niosvprocessor_inst_clk_bfm                  
vmap       niosvprocessor_inst_clk_bfm                   ./libraries/niosvprocessor_inst_clk_bfm                  
ensure_lib                                               ./libraries/niosvprocessor_inst                          
vmap       niosvprocessor_inst                           ./libraries/niosvprocessor_inst                          

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                    -work altera_ver           
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                             -work lpm_ver              
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                -work sgate_ver            
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                            -work altera_mf_ver        
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                        -work altera_lnsim_ver     
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_atoms_ncrypt.v"          -work cyclonev_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                       -work cyclonev_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                  -work cyclonev_hssi_ver    
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"              -work cyclonev_pcie_hip_ver
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/verbosity_pkg.sv"                                                                                   -work altera_common_sv_packages                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -l altera_common_sv_packages -work error_adapter_0                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_avalon_st_adapter.v"                                               -work avalon_st_adapter                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_rsp_mux_002.sv"                       -l altera_common_sv_packages -work rsp_mux_002                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -l altera_common_sv_packages -work rsp_mux_002                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_rsp_mux.sv"                           -l altera_common_sv_packages -work rsp_mux                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -l altera_common_sv_packages -work rsp_mux                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_rsp_demux.sv"                         -l altera_common_sv_packages -work rsp_demux                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_mux_001.sv"                       -l altera_common_sv_packages -work cmd_mux_001                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -l altera_common_sv_packages -work cmd_mux_001                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_mux.sv"                           -l altera_common_sv_packages -work cmd_mux                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -l altera_common_sv_packages -work cmd_mux                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_demux_002.sv"                     -l altera_common_sv_packages -work cmd_demux_002                                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_demux.sv"                         -l altera_common_sv_packages -work cmd_demux                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter.sv"                                        -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                 -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                                   -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                    -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_incr_burst_converter.sv"                                        -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_wrap_burst_converter.sv"                                        -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_default_burst_converter.sv"                                     -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                    -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                    -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                      -l altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_traffic_limiter.sv"                                      -l altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_reorder_memory.sv"                                       -l altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                               -l altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                      -l altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router_005.sv"                        -l altera_common_sv_packages -work router_005                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router_004.sv"                        -l altera_common_sv_packages -work router_004                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router_002.sv"                        -l altera_common_sv_packages -work router_002                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router.sv"                            -l altera_common_sv_packages -work router                                       
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                                            -work jtag_avalon_jtag_slave_agent_rsp_fifo        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                          -l altera_common_sv_packages -work jtag_avalon_jtag_slave_agent                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                   -l altera_common_sv_packages -work jtag_avalon_jtag_slave_agent                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_axi_master_ni.sv"                                        -l altera_common_sv_packages -work niosvprocessor_data_manager_agent            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                    -l altera_common_sv_packages -work niosvprocessor_data_manager_agent            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                     -l altera_common_sv_packages -work jtag_avalon_jtag_slave_translator            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_axi_translator.sv"                                       -l altera_common_sv_packages -work niosvprocessor_data_manager_translator       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_niosvprocessor_irq_mapper.sv"                           -l altera_common_sv_packages -work irq_mapper                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_dm_def.sv"                                                 -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_ram.sv"                                                    -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_dm_jtag2mm.sv"                                             -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_dm_top.sv"                                                 -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_debug_module.sv"                                           -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_std_synchronizer_bundle.v"                                      -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_std_synchronizer_nocut.v"                                       -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_std_synchronizer.v"                                             -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_clock_crosser.v"                                      -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_handshake_clock_crosser.v"                            -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                      -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                    -l altera_common_sv_packages -work dbg_mod                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_timer_msip.sv"                                             -l altera_common_sv_packages -work timer_module                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_opcode_def.sv"                                             -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_mem_op_state.sv"                                           -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_ram.sv"                                                    -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_reg_file.sv"                                               -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_csr.sv"                                                    -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_interrupt_handler.sv"                                      -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_multiplier.sv"                                             -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_divider.sv"                                                -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_instr_buffer.sv"                                           -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_32dec.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_32enc.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_dec20.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_enc20.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_dec21.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_enc21.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_dec22.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_enc22.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_dec23.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_enc23.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_dec24.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_enc24.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_dec25.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_enc25.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_dec26.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_altecc_enc26.v"                                            -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_ecc_ram.sv"                                                -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_enc_dec.v"                                                 -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_tcm_ram.sv"                                                -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_victim_buffer.sv"                                          -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_alu.sv"                                                  -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_fetch.sv"                                                -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_dcache.sv"                                               -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_instr_cache.sv"                                          -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_fp_def.sv"                                               -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_fpu.sv"                                                  -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/int33_to_fp32.sv"                                                -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/fp32_to_int32.sv"                                                -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/fp32_to_uint32.sv"                                               -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/fp32_alu_cycloneivgx.sv"                                         -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/fp32_mult_cycloneivgx.sv"                                        -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/fp32_div.sv"                                                     -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/fp32_sqrt.sv"                                                    -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_dspba_library_ver.sv"                                    -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/instr_decoder_niosvprocessor_niosvprocessor_hart.sv"             -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosv_g_core_niosvprocessor_niosvprocessor_hart.sv"              -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/aldec/niosvprocessor_niosvprocessor_hart.sv"                           -l altera_common_sv_packages -work hart                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                               -l altera_common_sv_packages -work hart                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_reset_controller.v"                                                                          -work rst_controller                               
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_reset_synchronizer.v"                                                                        -work rst_controller                               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_irq_mapper.sv"                                          -l altera_common_sv_packages -work irq_mapper                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0.v"                                                                 -work mm_interconnect_0                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_sram.v"                                                                              -work sram                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_niosvprocessor.v"                                                                    -work niosvprocessor                               
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_jtag.v"                                                                              -work jtag                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_clock_source.sv"                                         -l altera_common_sv_packages -work niosvprocessor_inst_clk_bfm                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor.v"                                                                                   -work niosvprocessor_inst                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/niosvprocessor_tb.v"                                                                                                                                              
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L altera_common_sv_packages -L error_adapter_0 -L avalon_st_adapter -L rsp_mux_002 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_002 -L cmd_demux -L jtag_avalon_jtag_slave_burst_adapter -L niosvprocessor_instruction_manager_wr_limiter -L router_005 -L router_004 -L router_002 -L router -L jtag_avalon_jtag_slave_agent_rsp_fifo -L jtag_avalon_jtag_slave_agent -L niosvprocessor_data_manager_agent -L jtag_avalon_jtag_slave_translator -L niosvprocessor_data_manager_translator -L irq_mapper -L dbg_mod -L timer_module -L hart -L rst_controller -L mm_interconnect_0 -L sram -L niosvprocessor -L jtag -L niosvprocessor_inst_clk_bfm -L niosvprocessor_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L altera_common_sv_packages -L error_adapter_0 -L avalon_st_adapter -L rsp_mux_002 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_002 -L cmd_demux -L jtag_avalon_jtag_slave_burst_adapter -L niosvprocessor_instruction_manager_wr_limiter -L router_005 -L router_004 -L router_002 -L router -L jtag_avalon_jtag_slave_agent_rsp_fifo -L jtag_avalon_jtag_slave_agent -L niosvprocessor_data_manager_agent -L jtag_avalon_jtag_slave_translator -L niosvprocessor_data_manager_translator -L irq_mapper -L dbg_mod -L timer_module -L hart -L rst_controller -L mm_interconnect_0 -L sram -L niosvprocessor -L jtag -L niosvprocessor_inst_clk_bfm -L niosvprocessor_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h
