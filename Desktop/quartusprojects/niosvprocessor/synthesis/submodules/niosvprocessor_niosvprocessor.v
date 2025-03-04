// niosvprocessor_niosvprocessor.v

// This file was auto-generated from intel_niosv_g_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 23.1 991

`timescale 1 ps / 1 ps
module niosvprocessor_niosvprocessor (
		input  wire        clk,                          //                 clk.clk
		input  wire        reset_reset,                  //               reset.reset
		input  wire [15:0] platform_irq_rx_irq,          //     platform_irq_rx.irq
		output wire [31:0] instruction_manager_awaddr,   // instruction_manager.awaddr
		output wire [2:0]  instruction_manager_awsize,   //                    .awsize
		output wire [7:0]  instruction_manager_awlen,    //                    .awlen
		output wire [2:0]  instruction_manager_awprot,   //                    .awprot
		output wire        instruction_manager_awvalid,  //                    .awvalid
		output wire [1:0]  instruction_manager_awburst,  //                    .awburst
		input  wire        instruction_manager_awready,  //                    .awready
		output wire [31:0] instruction_manager_wdata,    //                    .wdata
		output wire [3:0]  instruction_manager_wstrb,    //                    .wstrb
		output wire        instruction_manager_wlast,    //                    .wlast
		output wire        instruction_manager_wvalid,   //                    .wvalid
		input  wire        instruction_manager_wready,   //                    .wready
		input  wire [1:0]  instruction_manager_bresp,    //                    .bresp
		input  wire        instruction_manager_bvalid,   //                    .bvalid
		output wire        instruction_manager_bready,   //                    .bready
		output wire [31:0] instruction_manager_araddr,   //                    .araddr
		output wire [2:0]  instruction_manager_arsize,   //                    .arsize
		output wire [7:0]  instruction_manager_arlen,    //                    .arlen
		output wire [2:0]  instruction_manager_arprot,   //                    .arprot
		output wire        instruction_manager_arvalid,  //                    .arvalid
		output wire [1:0]  instruction_manager_arburst,  //                    .arburst
		input  wire        instruction_manager_arready,  //                    .arready
		input  wire [31:0] instruction_manager_rdata,    //                    .rdata
		input  wire [1:0]  instruction_manager_rresp,    //                    .rresp
		input  wire        instruction_manager_rvalid,   //                    .rvalid
		output wire        instruction_manager_rready,   //                    .rready
		input  wire        instruction_manager_rlast,    //                    .rlast
		output wire [31:0] data_manager_awaddr,          //        data_manager.awaddr
		output wire [2:0]  data_manager_awsize,          //                    .awsize
		output wire [7:0]  data_manager_awlen,           //                    .awlen
		output wire [2:0]  data_manager_awprot,          //                    .awprot
		output wire        data_manager_awvalid,         //                    .awvalid
		input  wire        data_manager_awready,         //                    .awready
		output wire [31:0] data_manager_wdata,           //                    .wdata
		output wire [3:0]  data_manager_wstrb,           //                    .wstrb
		output wire        data_manager_wlast,           //                    .wlast
		output wire        data_manager_wvalid,          //                    .wvalid
		input  wire        data_manager_wready,          //                    .wready
		input  wire [1:0]  data_manager_bresp,           //                    .bresp
		input  wire        data_manager_bvalid,          //                    .bvalid
		output wire        data_manager_bready,          //                    .bready
		output wire [31:0] data_manager_araddr,          //                    .araddr
		output wire [2:0]  data_manager_arsize,          //                    .arsize
		output wire [7:0]  data_manager_arlen,           //                    .arlen
		output wire [2:0]  data_manager_arprot,          //                    .arprot
		output wire        data_manager_arvalid,         //                    .arvalid
		input  wire        data_manager_arready,         //                    .arready
		input  wire [31:0] data_manager_rdata,           //                    .rdata
		input  wire [1:0]  data_manager_rresp,           //                    .rresp
		input  wire        data_manager_rvalid,          //                    .rvalid
		input  wire        data_manager_rlast,           //                    .rlast
		output wire        data_manager_rready,          //                    .rready
		input  wire        ndm_reset_in_reset,           //        ndm_reset_in.reset
		input  wire        timer_sw_agent_write,         //      timer_sw_agent.write
		input  wire [31:0] timer_sw_agent_writedata,     //                    .writedata
		input  wire [3:0]  timer_sw_agent_byteenable,    //                    .byteenable
		input  wire [5:0]  timer_sw_agent_address,       //                    .address
		input  wire        timer_sw_agent_read,          //                    .read
		output wire [31:0] timer_sw_agent_readdata,      //                    .readdata
		output wire        timer_sw_agent_readdatavalid, //                    .readdatavalid
		output wire        timer_sw_agent_waitrequest,   //                    .waitrequest
		input  wire        dm_agent_write,               //            dm_agent.write
		input  wire [31:0] dm_agent_writedata,           //                    .writedata
		input  wire [15:0] dm_agent_address,             //                    .address
		input  wire        dm_agent_read,                //                    .read
		output wire [31:0] dm_agent_readdata,            //                    .readdata
		output wire        dm_agent_readdatavalid,       //                    .readdatavalid
		output wire        dm_agent_waitrequest,         //                    .waitrequest
		output wire        dbg_reset_out_reset           //       dbg_reset_out.reset
	);

	wire    irq_mapper_receiver0_irq;           // dbg_mod:dbg_irq -> irq_mapper:receiver0_irq
	wire    hart_debug_irq_rx_irq;              // irq_mapper:sender_irq -> hart:irq_debug
	wire    irq_mapper_001_receiver0_irq;       // timer_module:timer_irq -> irq_mapper_001:receiver0_irq
	wire    hart_timer_irq_rx_irq;              // irq_mapper_001:sender_irq -> hart:irq_timer
	wire    irq_mapper_002_receiver0_irq;       // timer_module:sw_irq -> irq_mapper_002:receiver0_irq
	wire    hart_sw_irq_rx_irq;                 // irq_mapper_002:sender_irq -> hart:irq_sw
	wire    rst_controller_reset_out_reset;     // rst_controller:reset_out -> hart:reset
	wire    rst_controller_001_reset_out_reset; // rst_controller_001:reset_out -> [irq_mapper:reset, irq_mapper_001:reset, irq_mapper_002:reset, timer_module:reset]

	niosvprocessor_niosvprocessor_hart #(
		.RESET_VECTOR             (32'b00000000000000000000000000000000),
		.DBG_EXPN_VECTOR          (32'b00000000000010000000000000000000),
		.CORE_EXTN                (4352),
		.DEBUG_ENABLED            (1),
		.DEVICE_FAMILY            ("Cyclone V"),
		.USE_RESET_REQ            (0),
		.ECC_EN                   (0),
		.DATA_CACHE_SIZE          (4096),
		.INST_CACHE_SIZE          (4096),
		.ITCM1_SIZE               (0),
		.ITCM1_BASE               (32'b00000000000000000000000000000000),
		.ITCM1_INIT_FILE          (""),
		.ITCM2_SIZE               (0),
		.ITCM2_BASE               (32'b00000000000000000000000000000000),
		.ITCM2_INIT_FILE          (""),
		.PERIPHERAL_REGION_A_SIZE (0),
		.PERIPHERAL_REGION_A_BASE (32'b00000000000000000000000000000000),
		.PERIPHERAL_REGION_B_SIZE (0),
		.PERIPHERAL_REGION_B_BASE (32'b00000000000000000000000000000000),
		.DBG_DATA_S_BASE          (32'b00000000000010000000000000000000),
		.TIMER_MSIP_DATA_S_BASE   (32'b00000000000010010000000000000000),
		.DTCM1_SIZE               (0),
		.DTCM1_BASE               (32'b00000000000000000000000000000000),
		.DTCM1_INIT_FILE          (""),
		.DTCM2_SIZE               (0),
		.DTCM2_BASE               (32'b00000000000000000000000000000000),
		.DTCM2_INIT_FILE          (""),
		.ITCS1_ADDR_WIDTH         (10),
		.ITCS2_ADDR_WIDTH         (10),
		.DTCS1_ADDR_WIDTH         (10),
		.DTCS2_ADDR_WIDTH         (10)
	) hart (
		.clk             (clk),                                  //             cpu_clk.clk
		.reset           (rst_controller_reset_out_reset),       //           cpu_reset.reset
		.core_ecc_status (),                                     //      cpu_ecc_status.ecc_status
		.core_ecc_src    (),                                     //                    .ecc_source
		.irq_plat_vec    (platform_irq_rx_irq),                  //     platform_irq_rx.irq
		.irq_debug       (hart_debug_irq_rx_irq),                //        debug_irq_rx.irq
		.irq_timer       (hart_timer_irq_rx_irq),                //        timer_irq_rx.irq
		.irq_sw          (hart_sw_irq_rx_irq),                   //           sw_irq_rx.irq
		.instr_awaddr    (instruction_manager_awaddr),           // instruction_manager.awaddr
		.instr_awsize    (instruction_manager_awsize),           //                    .awsize
		.instr_awlen     (instruction_manager_awlen),            //                    .awlen
		.instr_awprot    (instruction_manager_awprot),           //                    .awprot
		.instr_awvalid   (instruction_manager_awvalid),          //                    .awvalid
		.instr_awburst   (instruction_manager_awburst),          //                    .awburst
		.instr_awready   (instruction_manager_awready),          //                    .awready
		.instr_wdata     (instruction_manager_wdata),            //                    .wdata
		.instr_wstrb     (instruction_manager_wstrb),            //                    .wstrb
		.instr_wlast     (instruction_manager_wlast),            //                    .wlast
		.instr_wvalid    (instruction_manager_wvalid),           //                    .wvalid
		.instr_wready    (instruction_manager_wready),           //                    .wready
		.instr_bresp     (instruction_manager_bresp),            //                    .bresp
		.instr_bvalid    (instruction_manager_bvalid),           //                    .bvalid
		.instr_bready    (instruction_manager_bready),           //                    .bready
		.instr_araddr    (instruction_manager_araddr),           //                    .araddr
		.instr_arsize    (instruction_manager_arsize),           //                    .arsize
		.instr_arlen     (instruction_manager_arlen),            //                    .arlen
		.instr_arprot    (instruction_manager_arprot),           //                    .arprot
		.instr_arvalid   (instruction_manager_arvalid),          //                    .arvalid
		.instr_arburst   (instruction_manager_arburst),          //                    .arburst
		.instr_arready   (instruction_manager_arready),          //                    .arready
		.instr_rdata     (instruction_manager_rdata),            //                    .rdata
		.instr_rresp     (instruction_manager_rresp),            //                    .rresp
		.instr_rvalid    (instruction_manager_rvalid),           //                    .rvalid
		.instr_rready    (instruction_manager_rready),           //                    .rready
		.instr_rlast     (instruction_manager_rlast),            //                    .rlast
		.data_awaddr     (data_manager_awaddr),                  //        data_manager.awaddr
		.data_awsize     (data_manager_awsize),                  //                    .awsize
		.data_awlen      (data_manager_awlen),                   //                    .awlen
		.data_awprot     (data_manager_awprot),                  //                    .awprot
		.data_awvalid    (data_manager_awvalid),                 //                    .awvalid
		.data_awready    (data_manager_awready),                 //                    .awready
		.data_wdata      (data_manager_wdata),                   //                    .wdata
		.data_wstrb      (data_manager_wstrb),                   //                    .wstrb
		.data_wlast      (data_manager_wlast),                   //                    .wlast
		.data_wvalid     (data_manager_wvalid),                  //                    .wvalid
		.data_wready     (data_manager_wready),                  //                    .wready
		.data_bresp      (data_manager_bresp),                   //                    .bresp
		.data_bvalid     (data_manager_bvalid),                  //                    .bvalid
		.data_bready     (data_manager_bready),                  //                    .bready
		.data_araddr     (data_manager_araddr),                  //                    .araddr
		.data_arsize     (data_manager_arsize),                  //                    .arsize
		.data_arlen      (data_manager_arlen),                   //                    .arlen
		.data_arprot     (data_manager_arprot),                  //                    .arprot
		.data_arvalid    (data_manager_arvalid),                 //                    .arvalid
		.data_arready    (data_manager_arready),                 //                    .arready
		.data_rdata      (data_manager_rdata),                   //                    .rdata
		.data_rresp      (data_manager_rresp),                   //                    .rresp
		.data_rvalid     (data_manager_rvalid),                  //                    .rvalid
		.data_rlast      (data_manager_rlast),                   //                    .rlast
		.data_rready     (data_manager_rready),                  //                    .rready
		.reset_req       (1'b0),                                 //         (terminated)
		.reset_req_ack   (),                                     //         (terminated)
		.itcs1_awaddr    (10'b0000000000),                       //         (terminated)
		.itcs1_awprot    (3'b000),                               //         (terminated)
		.itcs1_awvalid   (1'b0),                                 //         (terminated)
		.itcs1_awready   (),                                     //         (terminated)
		.itcs1_wdata     (32'b00000000000000000000000000000000), //         (terminated)
		.itcs1_wstrb     (4'b0000),                              //         (terminated)
		.itcs1_wvalid    (1'b0),                                 //         (terminated)
		.itcs1_wready    (),                                     //         (terminated)
		.itcs1_bresp     (),                                     //         (terminated)
		.itcs1_bvalid    (),                                     //         (terminated)
		.itcs1_bready    (1'b0),                                 //         (terminated)
		.itcs1_araddr    (10'b0000000000),                       //         (terminated)
		.itcs1_arprot    (3'b000),                               //         (terminated)
		.itcs1_arvalid   (1'b0),                                 //         (terminated)
		.itcs1_arready   (),                                     //         (terminated)
		.itcs1_rdata     (),                                     //         (terminated)
		.itcs1_rresp     (),                                     //         (terminated)
		.itcs1_rvalid    (),                                     //         (terminated)
		.itcs1_rready    (1'b0),                                 //         (terminated)
		.itcs2_awaddr    (10'b0000000000),                       //         (terminated)
		.itcs2_awprot    (3'b000),                               //         (terminated)
		.itcs2_awvalid   (1'b0),                                 //         (terminated)
		.itcs2_awready   (),                                     //         (terminated)
		.itcs2_wdata     (32'b00000000000000000000000000000000), //         (terminated)
		.itcs2_wstrb     (4'b0000),                              //         (terminated)
		.itcs2_wvalid    (1'b0),                                 //         (terminated)
		.itcs2_wready    (),                                     //         (terminated)
		.itcs2_bresp     (),                                     //         (terminated)
		.itcs2_bvalid    (),                                     //         (terminated)
		.itcs2_bready    (1'b0),                                 //         (terminated)
		.itcs2_araddr    (10'b0000000000),                       //         (terminated)
		.itcs2_arprot    (3'b000),                               //         (terminated)
		.itcs2_arvalid   (1'b0),                                 //         (terminated)
		.itcs2_arready   (),                                     //         (terminated)
		.itcs2_rdata     (),                                     //         (terminated)
		.itcs2_rresp     (),                                     //         (terminated)
		.itcs2_rvalid    (),                                     //         (terminated)
		.itcs2_rready    (1'b0),                                 //         (terminated)
		.dtcs1_awaddr    (10'b0000000000),                       //         (terminated)
		.dtcs1_awprot    (3'b000),                               //         (terminated)
		.dtcs1_awvalid   (1'b0),                                 //         (terminated)
		.dtcs1_awready   (),                                     //         (terminated)
		.dtcs1_wdata     (32'b00000000000000000000000000000000), //         (terminated)
		.dtcs1_wstrb     (4'b0000),                              //         (terminated)
		.dtcs1_wvalid    (1'b0),                                 //         (terminated)
		.dtcs1_wready    (),                                     //         (terminated)
		.dtcs1_bresp     (),                                     //         (terminated)
		.dtcs1_bvalid    (),                                     //         (terminated)
		.dtcs1_bready    (1'b0),                                 //         (terminated)
		.dtcs1_araddr    (10'b0000000000),                       //         (terminated)
		.dtcs1_arprot    (3'b000),                               //         (terminated)
		.dtcs1_arvalid   (1'b0),                                 //         (terminated)
		.dtcs1_arready   (),                                     //         (terminated)
		.dtcs1_rdata     (),                                     //         (terminated)
		.dtcs1_rresp     (),                                     //         (terminated)
		.dtcs1_rvalid    (),                                     //         (terminated)
		.dtcs1_rready    (1'b0),                                 //         (terminated)
		.dtcs2_awaddr    (10'b0000000000),                       //         (terminated)
		.dtcs2_awprot    (3'b000),                               //         (terminated)
		.dtcs2_awvalid   (1'b0),                                 //         (terminated)
		.dtcs2_awready   (),                                     //         (terminated)
		.dtcs2_wdata     (32'b00000000000000000000000000000000), //         (terminated)
		.dtcs2_wstrb     (4'b0000),                              //         (terminated)
		.dtcs2_wvalid    (1'b0),                                 //         (terminated)
		.dtcs2_wready    (),                                     //         (terminated)
		.dtcs2_bresp     (),                                     //         (terminated)
		.dtcs2_bvalid    (),                                     //         (terminated)
		.dtcs2_bready    (1'b0),                                 //         (terminated)
		.dtcs2_araddr    (10'b0000000000),                       //         (terminated)
		.dtcs2_arprot    (3'b000),                               //         (terminated)
		.dtcs2_arvalid   (1'b0),                                 //         (terminated)
		.dtcs2_arready   (),                                     //         (terminated)
		.dtcs2_rdata     (),                                     //         (terminated)
		.dtcs2_rresp     (),                                     //         (terminated)
		.dtcs2_rvalid    (),                                     //         (terminated)
		.dtcs2_rready    (1'b0),                                 //         (terminated)
		.irq_ext         (1'b0)                                  //         (terminated)
	);

	niosv_timer_msip #(
		.IRQ_EN (1)
	) timer_module (
		.clk                (clk),                                //            clk.clk
		.reset              (rst_controller_001_reset_out_reset), //          reset.reset
		.hart_write         (timer_sw_agent_write),               // timer_sw_agent.write
		.hart_writedata     (timer_sw_agent_writedata),           //               .writedata
		.hart_byteen        (timer_sw_agent_byteenable),          //               .byteenable
		.hart_address       (timer_sw_agent_address),             //               .address
		.hart_read          (timer_sw_agent_read),                //               .read
		.hart_readdata      (timer_sw_agent_readdata),            //               .readdata
		.hart_readdatavalid (timer_sw_agent_readdatavalid),       //               .readdatavalid
		.hart_waitrequest   (timer_sw_agent_waitrequest),         //               .waitrequest
		.timer_irq          (irq_mapper_001_receiver0_irq),       //      timer_irq.irq
		.sw_irq             (irq_mapper_002_receiver0_irq)        //         sw_irq.irq
	);

	niosv_dm_top #(
		.DEBUG_RESET_EN (1),
		.FPU_EN         (0),
		.DEVICE_FAMILY  ("Cyclone V")
	) dbg_mod (
		.clk                (clk),                      //           clk.clk
		.reset              (reset_reset),              //         reset.reset
		.hart_write         (dm_agent_write),           //      dm_agent.write
		.hart_writedata     (dm_agent_writedata),       //              .writedata
		.hart_address       (dm_agent_address),         //              .address
		.hart_read          (dm_agent_read),            //              .read
		.hart_readdata      (dm_agent_readdata),        //              .readdata
		.hart_readdatavalid (dm_agent_readdatavalid),   //              .readdatavalid
		.hart_waitrequest   (dm_agent_waitrequest),     //              .waitrequest
		.dbg_irq            (irq_mapper_receiver0_irq), //       dbg_irq.irq
		.dbg_reset          (dbg_reset_out_reset)       // dbg_reset_out.reset
	);

	niosvprocessor_niosvprocessor_irq_mapper irq_mapper (
		.clk           (clk),                                //       clk.clk
		.reset         (rst_controller_001_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),           // receiver0.irq
		.sender_irq    (hart_debug_irq_rx_irq)               //    sender.irq
	);

	niosvprocessor_niosvprocessor_irq_mapper irq_mapper_001 (
		.clk           (clk),                                //       clk.clk
		.reset         (rst_controller_001_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_001_receiver0_irq),       // receiver0.irq
		.sender_irq    (hart_timer_irq_rx_irq)               //    sender.irq
	);

	niosvprocessor_niosvprocessor_irq_mapper irq_mapper_002 (
		.clk           (clk),                                //       clk.clk
		.reset         (rst_controller_001_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_002_receiver0_irq),       // receiver0.irq
		.sender_irq    (hart_sw_irq_rx_irq)                  //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("none"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (reset_reset),                    // reset_in0.reset
		.reset_in1      (ndm_reset_in_reset),             // reset_in1.reset
		.clk            (),                               //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (reset_reset),                        // reset_in0.reset
		.reset_in1      (ndm_reset_in_reset),                 // reset_in1.reset
		.clk            (clk),                                //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
