
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

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
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
# into a new file, e.g. named "mentor.do", and modify the text as directed.
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
# source $QSYS_SIMDIR/mentor/msim_setup.tcl
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
# vlog <compilation options> <design and testbench files>
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
# run -a
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
# ACDS 23.1 991 win32 2024.06.08.01:52:19

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
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*Intel*FPGA*" [ vsim -version ] ] {
  ensure_lib                       ./libraries/altera_ver/           
  vmap       altera_ver            ./libraries/altera_ver/           
  ensure_lib                       ./libraries/lpm_ver/              
  vmap       lpm_ver               ./libraries/lpm_ver/              
  ensure_lib                       ./libraries/sgate_ver/            
  vmap       sgate_ver             ./libraries/sgate_ver/            
  ensure_lib                       ./libraries/altera_mf_ver/        
  vmap       altera_mf_ver         ./libraries/altera_mf_ver/        
  ensure_lib                       ./libraries/altera_lnsim_ver/     
  vmap       altera_lnsim_ver      ./libraries/altera_lnsim_ver/     
  ensure_lib                       ./libraries/cyclonev_ver/         
  vmap       cyclonev_ver          ./libraries/cyclonev_ver/         
  ensure_lib                       ./libraries/cyclonev_hssi_ver/    
  vmap       cyclonev_hssi_ver     ./libraries/cyclonev_hssi_ver/    
  ensure_lib                       ./libraries/cyclonev_pcie_hip_ver/
  vmap       cyclonev_pcie_hip_ver ./libraries/cyclonev_pcie_hip_ver/
}
ensure_lib                                               ./libraries/altera_common_sv_packages/                    
vmap       altera_common_sv_packages                     ./libraries/altera_common_sv_packages/                    
ensure_lib                                               ./libraries/error_adapter_0/                              
vmap       error_adapter_0                               ./libraries/error_adapter_0/                              
ensure_lib                                               ./libraries/avalon_st_adapter/                            
vmap       avalon_st_adapter                             ./libraries/avalon_st_adapter/                            
ensure_lib                                               ./libraries/rsp_mux_002/                                  
vmap       rsp_mux_002                                   ./libraries/rsp_mux_002/                                  
ensure_lib                                               ./libraries/rsp_mux/                                      
vmap       rsp_mux                                       ./libraries/rsp_mux/                                      
ensure_lib                                               ./libraries/rsp_demux/                                    
vmap       rsp_demux                                     ./libraries/rsp_demux/                                    
ensure_lib                                               ./libraries/cmd_mux_001/                                  
vmap       cmd_mux_001                                   ./libraries/cmd_mux_001/                                  
ensure_lib                                               ./libraries/cmd_mux/                                      
vmap       cmd_mux                                       ./libraries/cmd_mux/                                      
ensure_lib                                               ./libraries/cmd_demux_002/                                
vmap       cmd_demux_002                                 ./libraries/cmd_demux_002/                                
ensure_lib                                               ./libraries/cmd_demux/                                    
vmap       cmd_demux                                     ./libraries/cmd_demux/                                    
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_burst_adapter/         
vmap       jtag_avalon_jtag_slave_burst_adapter          ./libraries/jtag_avalon_jtag_slave_burst_adapter/         
ensure_lib                                               ./libraries/niosvprocessor_instruction_manager_wr_limiter/
vmap       niosvprocessor_instruction_manager_wr_limiter ./libraries/niosvprocessor_instruction_manager_wr_limiter/
ensure_lib                                               ./libraries/router_005/                                   
vmap       router_005                                    ./libraries/router_005/                                   
ensure_lib                                               ./libraries/router_004/                                   
vmap       router_004                                    ./libraries/router_004/                                   
ensure_lib                                               ./libraries/router_002/                                   
vmap       router_002                                    ./libraries/router_002/                                   
ensure_lib                                               ./libraries/router/                                       
vmap       router                                        ./libraries/router/                                       
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_agent_rsp_fifo/        
vmap       jtag_avalon_jtag_slave_agent_rsp_fifo         ./libraries/jtag_avalon_jtag_slave_agent_rsp_fifo/        
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_agent/                 
vmap       jtag_avalon_jtag_slave_agent                  ./libraries/jtag_avalon_jtag_slave_agent/                 
ensure_lib                                               ./libraries/niosvprocessor_data_manager_agent/            
vmap       niosvprocessor_data_manager_agent             ./libraries/niosvprocessor_data_manager_agent/            
ensure_lib                                               ./libraries/jtag_avalon_jtag_slave_translator/            
vmap       jtag_avalon_jtag_slave_translator             ./libraries/jtag_avalon_jtag_slave_translator/            
ensure_lib                                               ./libraries/niosvprocessor_data_manager_translator/       
vmap       niosvprocessor_data_manager_translator        ./libraries/niosvprocessor_data_manager_translator/       
ensure_lib                                               ./libraries/irq_mapper/                                   
vmap       irq_mapper                                    ./libraries/irq_mapper/                                   
ensure_lib                                               ./libraries/dbg_mod/                                      
vmap       dbg_mod                                       ./libraries/dbg_mod/                                      
ensure_lib                                               ./libraries/timer_module/                                 
vmap       timer_module                                  ./libraries/timer_module/                                 
ensure_lib                                               ./libraries/hart/                                         
vmap       hart                                          ./libraries/hart/                                         
ensure_lib                                               ./libraries/rst_controller/                               
vmap       rst_controller                                ./libraries/rst_controller/                               
ensure_lib                                               ./libraries/mm_interconnect_0/                            
vmap       mm_interconnect_0                             ./libraries/mm_interconnect_0/                            
ensure_lib                                               ./libraries/sram/                                         
vmap       sram                                          ./libraries/sram/                                         
ensure_lib                                               ./libraries/niosvprocessor/                               
vmap       niosvprocessor                                ./libraries/niosvprocessor/                               
ensure_lib                                               ./libraries/jtag/                                         
vmap       jtag                                          ./libraries/jtag/                                         
ensure_lib                                               ./libraries/niosvprocessor_inst_clk_bfm/                  
vmap       niosvprocessor_inst_clk_bfm                   ./libraries/niosvprocessor_inst_clk_bfm/                  
ensure_lib                                               ./libraries/niosvprocessor_inst/                          
vmap       niosvprocessor_inst                           ./libraries/niosvprocessor_inst/                          

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*Intel*FPGA*" [ vsim -version ] ] {
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                     -work altera_ver           
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                              -work lpm_ver              
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                 -work sgate_ver            
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                             -work altera_mf_ver        
    eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                         -work altera_lnsim_ver     
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v"          -work cyclonev_ver         
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                        -work cyclonev_ver         
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                   -work cyclonev_hssi_ver    
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"               -work cyclonev_pcie_hip_ver
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/verbosity_pkg.sv"                                                                                   -work altera_common_sv_packages                    
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -L altera_common_sv_packages -work error_adapter_0                              
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_avalon_st_adapter.v"                                               -work avalon_st_adapter                            
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_rsp_mux_002.sv"                       -L altera_common_sv_packages -work rsp_mux_002                                  
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -L altera_common_sv_packages -work rsp_mux_002                                  
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_rsp_mux.sv"                           -L altera_common_sv_packages -work rsp_mux                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -L altera_common_sv_packages -work rsp_mux                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_rsp_demux.sv"                         -L altera_common_sv_packages -work rsp_demux                                    
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_mux_001.sv"                       -L altera_common_sv_packages -work cmd_mux_001                                  
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -L altera_common_sv_packages -work cmd_mux_001                                  
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_mux.sv"                           -L altera_common_sv_packages -work cmd_mux                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                           -L altera_common_sv_packages -work cmd_mux                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_demux_002.sv"                     -L altera_common_sv_packages -work cmd_demux_002                                
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_cmd_demux.sv"                         -L altera_common_sv_packages -work cmd_demux                                    
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter.sv"                                        -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                 -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                                   -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                    -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_incr_burst_converter.sv"                                        -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_wrap_burst_converter.sv"                                        -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_default_burst_converter.sv"                                     -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                    -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                    -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                      -L altera_common_sv_packages -work jtag_avalon_jtag_slave_burst_adapter         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_traffic_limiter.sv"                                      -L altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_reorder_memory.sv"                                       -L altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                               -L altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                      -L altera_common_sv_packages -work niosvprocessor_instruction_manager_wr_limiter
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router_005.sv"                        -L altera_common_sv_packages -work router_005                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router_004.sv"                        -L altera_common_sv_packages -work router_004                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router_002.sv"                        -L altera_common_sv_packages -work router_002                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0_router.sv"                            -L altera_common_sv_packages -work router                                       
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                                            -work jtag_avalon_jtag_slave_agent_rsp_fifo        
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                          -L altera_common_sv_packages -work jtag_avalon_jtag_slave_agent                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                   -L altera_common_sv_packages -work jtag_avalon_jtag_slave_agent                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_axi_master_ni.sv"                                        -L altera_common_sv_packages -work niosvprocessor_data_manager_agent            
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_address_alignment.sv"                                    -L altera_common_sv_packages -work niosvprocessor_data_manager_agent            
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                     -L altera_common_sv_packages -work jtag_avalon_jtag_slave_translator            
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_merlin_axi_translator.sv"                                       -L altera_common_sv_packages -work niosvprocessor_data_manager_translator       
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_niosvprocessor_irq_mapper.sv"                           -L altera_common_sv_packages -work irq_mapper                                   
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_dm_def.sv"                                                -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_ram.sv"                                                   -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_dm_jtag2mm.sv"                                            -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_dm_top.sv"                                                -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_debug_module.sv"                                          -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_std_synchronizer_bundle.v"                                      -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_std_synchronizer_nocut.v"                                       -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_std_synchronizer.v"                                             -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_clock_crosser.v"                                      -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_handshake_clock_crosser.v"                            -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_base.v"                                      -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                    -L altera_common_sv_packages -work dbg_mod                                      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_timer_msip.sv"                                            -L altera_common_sv_packages -work timer_module                                 
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_opcode_def.sv"                                            -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_mem_op_state.sv"                                          -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_ram.sv"                                                   -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_reg_file.sv"                                              -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_csr.sv"                                                   -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_interrupt_handler.sv"                                     -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_multiplier.sv"                                            -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_divider.sv"                                               -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_instr_buffer.sv"                                          -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_32dec.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_32enc.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_dec20.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_enc20.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_dec21.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_enc21.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_dec22.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_enc22.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_dec23.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_enc23.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_dec24.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_enc24.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_dec25.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_enc25.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_dec26.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_altecc_enc26.v"                                           -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_ecc_ram.sv"                                               -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_enc_dec.v"                                                -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_tcm_ram.sv"                                               -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_victim_buffer.sv"                                         -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_alu.sv"                                                 -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_fetch.sv"                                               -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_dcache.sv"                                              -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_instr_cache.sv"                                         -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_fp_def.sv"                                              -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_fpu.sv"                                                 -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/int33_to_fp32.sv"                                               -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/fp32_to_int32.sv"                                               -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/fp32_to_uint32.sv"                                              -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/fp32_alu_cycloneivgx.sv"                                        -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/fp32_mult_cycloneivgx.sv"                                       -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/fp32_div.sv"                                                    -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/fp32_sqrt.sv"                                                   -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_dspba_library_ver.sv"                                   -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/instr_decoder_niosvprocessor_niosvprocessor_hart.sv"            -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosv_g_core_niosvprocessor_niosvprocessor_hart.sv"             -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/mentor/niosvprocessor_niosvprocessor_hart.sv"                          -L altera_common_sv_packages -work hart                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                               -L altera_common_sv_packages -work hart                                         
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_reset_controller.v"                                                                          -work rst_controller                               
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_reset_synchronizer.v"                                                                        -work rst_controller                               
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_irq_mapper.sv"                                          -L altera_common_sv_packages -work irq_mapper                                   
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_mm_interconnect_0.v"                                                                 -work mm_interconnect_0                            
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_sram.v"                                                                              -work sram                                         
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_niosvprocessor.v"                                                                    -work niosvprocessor                               
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor_jtag.v"                                                                              -work jtag                                         
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/altera_avalon_clock_source.sv"                                         -L altera_common_sv_packages -work niosvprocessor_inst_clk_bfm                  
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/submodules/niosvprocessor.v"                                                                                   -work niosvprocessor_inst                          
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/niosvprocessor_tb/simulation/niosvprocessor_tb.v"                                                                                                                                              
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L error_adapter_0 -L avalon_st_adapter -L rsp_mux_002 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_002 -L cmd_demux -L jtag_avalon_jtag_slave_burst_adapter -L niosvprocessor_instruction_manager_wr_limiter -L router_005 -L router_004 -L router_002 -L router -L jtag_avalon_jtag_slave_agent_rsp_fifo -L jtag_avalon_jtag_slave_agent -L niosvprocessor_data_manager_agent -L jtag_avalon_jtag_slave_translator -L niosvprocessor_data_manager_translator -L irq_mapper -L dbg_mod -L timer_module -L hart -L rst_controller -L mm_interconnect_0 -L sram -L niosvprocessor -L jtag -L niosvprocessor_inst_clk_bfm -L niosvprocessor_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -voptargs=+acc option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -voptargs=+acc -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L altera_common_sv_packages -L error_adapter_0 -L avalon_st_adapter -L rsp_mux_002 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_002 -L cmd_demux -L jtag_avalon_jtag_slave_burst_adapter -L niosvprocessor_instruction_manager_wr_limiter -L router_005 -L router_004 -L router_002 -L router -L jtag_avalon_jtag_slave_agent_rsp_fifo -L jtag_avalon_jtag_slave_agent -L niosvprocessor_data_manager_agent -L jtag_avalon_jtag_slave_translator -L niosvprocessor_data_manager_translator -L irq_mapper -L dbg_mod -L timer_module -L hart -L rst_controller -L mm_interconnect_0 -L sram -L niosvprocessor -L jtag -L niosvprocessor_inst_clk_bfm -L niosvprocessor_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -voptargs=+acc
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
  echo "elab_debug                                        -- Elaborate the top level design with -voptargs=+acc option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -voptargs=+acc"
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
