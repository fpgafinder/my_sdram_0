module top(
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
//verilog-library-directories-recursive:0
//End:
