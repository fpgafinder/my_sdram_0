module my_sdram_axi(
    input           clk,
    input           reset_n,

    // axi interface
    input           awvalid,
    output          awready,
    input   [31:0]  awaddr,
    input   [3:0]   awid,
    input   [7:0]   awlen,
    input   [1:0]   awburst,
    input           wvalid,
    output          wready,
    input   [31:0]  wdata,
    input   [3:0]   wstrb,
    input           wlast,
    output          bvalid,
    input           bready,
    output  [1:0]   bresp,
    output  [3:0]   bid,
    input           arvalid,
    output          arready,
    input   [31:0]  araddr,
    input   [3:0]   arid,
    input   [7:0]   arlen,
    input   [1:0]   arburst,
    output          rvalid,
    input           rready,
    output  [31:0]  rdata,
    output  [1:0]   rresp,
    output  [3:0]   rid,
    output          rlast,

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

wire    [15:0]  sdram_data_o; 
wire    [15:0]  sdram_data_i; 
wire            sdram_data_en; 

assign sdram_data_i = sdram_data;
assign sdram_data = sdram_data_en ? sdram_data_o : {16{1'bz}};


sdram_axi u0_sdram_axi(/*autoinst*/
    .clk_i                      (clk                     ), //I
    .rst_i                      (~reset_n                ), //I
    .inport_awvalid_i           (awvalid                 ), //I
    .inport_awready_o           (awready                 ), //O
    .inport_awaddr_i            (awaddr[31:0]            ), //I
    .inport_awid_i              (awid[3:0]               ), //I
    .inport_awlen_i             (awlen[7:0]              ), //I
    .inport_awburst_i           (awburst[1:0]            ), //I
    .inport_wvalid_i            (wvalid                  ), //I
    .inport_wdata_i             (wdata[31:0]             ), //I
    .inport_wstrb_i             (wstrb[3:0]              ), //I
    .inport_wlast_i             (wlast                   ), //I
    .inport_wready_o            (wready                  ), //O
    .inport_bvalid_o            (bvalid                  ), //O
    .inport_bresp_o             (bresp[1:0]              ), //O
    .inport_bid_o               (bid[3:0]                ), //O
    .inport_bready_i            (bready                  ), //I
    .inport_arvalid_i           (arvalid                 ), //I
    .inport_araddr_i            (araddr[31:0]            ), //I
    .inport_arid_i              (arid[3:0]               ), //I
    .inport_arlen_i             (arlen[7:0]              ), //I
    .inport_arburst_i           (arburst[1:0]            ), //I
    .inport_arready_o           (arready                 ), //O
    .inport_rready_i            (rready                  ), //I
    .inport_rvalid_o            (rvalid                  ), //O
    .inport_rdata_o             (rdata[31:0]             ), //O
    .inport_rresp_o             (rresp[1:0]              ), //O
    .inport_rid_o               (rid[3:0]                ), //O
    .inport_rlast_o             (rlast                   ), //O
    .sdram_data_input_i         (sdram_data_i[15:0]      ), //I
    .sdram_clk_o                (sdram_clk               ), //O
    .sdram_cke_o                (sdram_cke               ), //O
    .sdram_cs_o                 (sdram_cs                ), //O
    .sdram_ras_o                (sdram_ras               ), //O
    .sdram_cas_o                (sdram_cas               ), //O
    .sdram_we_o                 (sdram_we                ), //O
    .sdram_dqm_o                (sdram_dqm[1:0]          ), //O
    .sdram_addr_o               (sdram_addr[12:0]        ), //O
    .sdram_ba_o                 (sdram_ba[1:0]           ), //O
    .sdram_data_output_o        (sdram_data_o[15:0]      ), //O
    .sdram_data_out_en_o        (sdram_data_en           )  //O
);

endmodule

//Local Variables:
//verilog-library-directories:(".")
//verilog-library-directories:("/home/juntao/work/core_sdram_axi4/src_v")
//verilog-library-directories-recursive:0
//End:
