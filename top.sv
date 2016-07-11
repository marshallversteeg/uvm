module top;
   dg_bfm    bfm();
   tester     tester_i    (bfm);
   coverage   coverage_i  (bfm);
   scoreboard scoreboard_i(bfm);
   
   data_check_gen(
   		.clk(bfm.clk),
   		.data_en(bfm.data_en),
   		.pattern_mode(bfm.pattern_mode),
   		.pattern_word(bfm.pattern_word),
   		.pattern_init(bfm.pattern_init),
   		.rdata(bfm.rdata),
   		.rdata_bvld(bfm.rdata_bvld),
   		.rdata_vld(bfm.rdata_vld),
   		.wrd_cntr_rst(bfm.wrd_cntr_rst),
   		.wrd_cntr(bfm.wrd_cntr),
   		.data_o(bfm.data_o)
   	);

endmodule : top

     
   