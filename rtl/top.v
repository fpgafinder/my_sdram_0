module top(
    input           clk,
    input           reset_n,

    // sdram interface
    output          sdram_clk,
    output          sdram_cke,
    output          sdram_cs,
    output          sdram_ras,
    output          sdram_cas,
    output          sdram_we,
    output  [1:0]   sdram_dqm,
    output  [1:0]   sdram_ba,
    output  [12:0]  sdram_addr,
    inout   [15:0]  sdram_data
);

/*autowire*/
//Start of automatic wire
//Define assign wires here
//Define instance wires here
wire [3:0]                      awid                            ;
wire [31:0]                     awaddr                          ;
wire [7:0]                      awlen                           ;
wire [2:0]                      awsize                          ;
wire [1:0]                      awburst                         ;
wire [2:0]                      awprot                          ;
wire                            awvalid                         ;
wire                            awready                         ;
wire [31:0]                     wdata                           ;
wire [3:0]                      wstrb                           ;
wire                            wlast                           ;
wire                            wvalid                          ;
wire                            wready                          ;
wire [3:0]                      bid                             ;
wire [1:0]                      bresp                           ;
wire                            bvalid                          ;
wire                            bready                          ;
wire [3:0]                      arid                            ;
wire [31:0]                     araddr                          ;
wire [7:0]                      arlen                           ;
wire [2:0]                      arsize                          ;
wire [1:0]                      arburst                         ;
wire [2:0]                      arprot                          ;
wire                            arvalid                         ;
wire                            arready                         ;
wire [3:0]                      rid                             ;
wire [31:0]                     rdata                           ;
wire [1:0]                      rresp                           ;
wire                            rlast                           ;
wire                            rvalid                          ;
wire                            rready                          ;

//End of automatic wire

vjtag u0_vjtag(/*autoinst*/
    .axi_bridge_0_m0_awid       (awid[3:0]       ), //O
    .axi_bridge_0_m0_awaddr     (awaddr[31:0]    ), //O
    .axi_bridge_0_m0_awlen      (awlen[7:0]      ), //O
    .axi_bridge_0_m0_awsize     (awsize[2:0]     ), //O
    .axi_bridge_0_m0_awburst    (awburst[1:0]    ), //O
    .axi_bridge_0_m0_awprot     (awprot[2:0]     ), //O
    .axi_bridge_0_m0_awvalid    (awvalid         ), //O
    .axi_bridge_0_m0_awready    (awready         ), //I
    .axi_bridge_0_m0_wdata      (wdata[31:0]     ), //O
    .axi_bridge_0_m0_wstrb      (wstrb[3:0]      ), //O
    .axi_bridge_0_m0_wlast      (wlast           ), //O
    .axi_bridge_0_m0_wvalid     (wvalid          ), //O
    .axi_bridge_0_m0_wready     (wready          ), //I
    .axi_bridge_0_m0_bid        (bid[3:0]        ), //I
    .axi_bridge_0_m0_bresp      (bresp[1:0]      ), //I
    .axi_bridge_0_m0_bvalid     (bvalid          ), //I
    .axi_bridge_0_m0_bready     (bready          ), //O
    .axi_bridge_0_m0_arid       (arid[3:0]       ), //O
    .axi_bridge_0_m0_araddr     (araddr[31:0]    ), //O
    .axi_bridge_0_m0_arlen      (arlen[7:0]      ), //O
    .axi_bridge_0_m0_arsize     (arsize[2:0]     ), //O
    .axi_bridge_0_m0_arburst    (arburst[1:0]    ), //O
    .axi_bridge_0_m0_arprot     (arprot[2:0]     ), //O
    .axi_bridge_0_m0_arvalid    (arvalid         ), //O
    .axi_bridge_0_m0_arready    (arready         ), //I
    .axi_bridge_0_m0_rid        (rid[3:0]        ), //I
    .axi_bridge_0_m0_rdata      (rdata[31:0]     ), //I
    .axi_bridge_0_m0_rresp      (rresp[1:0]      ), //I
    .axi_bridge_0_m0_rlast      (rlast           ), //I
    .axi_bridge_0_m0_rvalid     (rvalid          ), //I
    .axi_bridge_0_m0_rready     (rready          ), //O
    .clk_clk                    (clk             ), //I
    .reset_reset_n              (reset_n         )  //I
);

my_sdram_axi u0_my_sdram_axi(/*autoinst*/
    .clk                        (clk                            ), //I
    .reset_n                    (reset_n                        ), //I
    .awvalid                    (awvalid                        ), //I
    .awready                    (awready                        ), //O
    .awaddr                     (awaddr[31:0]                   ), //I
    .awid                       (awid[3:0]                      ), //I
    .awlen                      (awlen[7:0]                     ), //I
    .awburst                    (awburst[1:0]                   ), //I
    .wvalid                     (wvalid                         ), //I
    .wready                     (wready                         ), //O
    .wdata                      (wdata[31:0]                    ), //I
    .wstrb                      (wstrb[3:0]                     ), //I
    .wlast                      (wlast                          ), //I
    .bvalid                     (bvalid                         ), //O
    .bready                     (bready                         ), //I
    .bresp                      (bresp[1:0]                     ), //O
    .bid                        (bid[3:0]                       ), //O
    .arvalid                    (arvalid                        ), //I
    .arready                    (arready                        ), //O
    .araddr                     (araddr[31:0]                   ), //I
    .arid                       (arid[3:0]                      ), //I
    .arlen                      (arlen[7:0]                     ), //I
    .arburst                    (arburst[1:0]                   ), //I
    .rvalid                     (rvalid                         ), //O
    .rready                     (rready                         ), //I
    .rdata                      (rdata[31:0]                    ), //O
    .rresp                      (rresp[1:0]                     ), //O
    .rid                        (rid[3:0]                       ), //O
    .rlast                      (rlast                          ), //O
    .sdram_clk                  (sdram_clk                      ), //O
    .sdram_cke                  (sdram_cke                      ), //O
    .sdram_cs                   (sdram_cs                       ), //O
    .sdram_ras                  (sdram_ras                      ), //O
    .sdram_cas                  (sdram_cas                      ), //O
    .sdram_we                   (sdram_we                       ), //O
    .sdram_dqm                  (sdram_dqm[1:0]                 ), //O
    .sdram_ba                   (sdram_ba[1:0]                  ), //O
    .sdram_addr                 (sdram_addr[12:0]               ), //O
    .sdram_data                 (sdram_data[15:0]               )  //IO //INST_NEW
    //INST_DEL: Port sdram_data_o has been deleted.
    //INST_DEL: Port sdram_data_en has been deleted.
    //INST_DEL: Port sdram_data_i has been deleted.
);



endmodule

//Local Variables:
//verilog-library-directories:(".")
//verilog-library-directories:("/home/juntao/work/core_sdram_axi4/src_v")
//verilog-library-directories:("/home/juntao/work/my_sdram_0/project/vjtag")
//verilog-library-directories-recursive:0
//End:
