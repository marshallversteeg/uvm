module tester(dg_bfm bfm);
    import dg_pkg::*;

    function pattern_t get_pattern();
        bit [2:0] pattern_choice;
        pattern_choice = $random;
        case (pattern_choice)
            3'b001 : return fixed;
            3'b010 : return addr;
            3'b011 : return walk1;
            3'b100 : return walk0;
            3'b101 : return prbs;
            //try again until we get a known pattern
            default: return get_pattern();
        endcase // case (op_choice)
    endfunction : get_op

    function bit [PATTERN_DATA_WIDTH-1:0] get_data();
        bit [PATTERN_DATA_WIDTH-1:0] data;
        data = $random;
        return data;
    endfunction : get_data
   
    function bit [7:0] get_length();
        bit [7:0] length;
        length = $random;
        return length;
    endfunction : get_length

    initial begin
        pattern_t pattern;
        bit [PATTERN_DATA_WIDTH-1:0] data;
        bit [7:0] length;

        bfm.reset();
        repeat (1000) begin : random_loop
            pattern = get_pattern();
            data = get_data();
            length = get_length();
            bfm.write_pattern(data, pattern, length);
        end : random_loop
        $stop;
    end // initial begin
endmodule : tester





