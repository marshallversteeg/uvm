package dg_pkg;
  typedef enum logic [2:0] {
    fixed = 3'b001,
    addr  = 3'b010,
    walk1 = 3'b011,
    walk0 = 3'b100,
    prbs  = 3'b101
  } pattern_t;

   parameter CLK_PERIOD          = 10;
   parameter PATTERN_DATA_WIDTH  = 32;
   parameter C_AXI_DATA_WIDTH    = 32;

endpackage : dg_pkg