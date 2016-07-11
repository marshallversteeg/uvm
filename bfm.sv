interface dg_bfm;
   import dg_pkg::*;

   logic                            clk;
   logic                            data_en;
   logic [2:0]                      pattern_mode;
   logic [PATTERN_DATA_WIDTH-1:0]   pattern_word;
   logic                            pattern_init;
   logic [C_AXI_DATA_WIDTH-1:0]     rdata;
   logic [C_AXI_DATA_WIDTH/8-1:0]   rdata_bvld;
   logic                            rdata_vld;
   logic                            wrd_cntr_rst;
   logic                            msmatch_err;
   wire [7:0]                       wrd_cntr;
   wire [C_AXI_DATA_WIDTH-1:0]      data_o;

   initial begin
      clk = 0;
      forever begin
         #CLK_PERIOD;
         clk = ~clk;
      end
   end

   task reset();
        data_en = 1'b0;
        pattern_init = 1'b0;
    endtask : reset

    task write_pattern(input logic [PATTERN_DATA_WIDTH-1:0] pw,
        input pattern_t pt, input int num_words);
        
        @(negedge clk);
        pattern_init = 1'b1;
        pattern_mode = pt;
        pattern_word = pw;

        @(negedge clk);
        pattern_init = 1'b0;
        data_en = 1'b1;

        for(int i = 0; i < num_word; ++i) begin
            @(negedge clk);
        end
        data_en = 1'b0;
        @(negedge clk)

    endtask : write_pattern

endinterface : tinyalu_bfm

   
