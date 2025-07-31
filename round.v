/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module round( output wire [ 63 : 0 ] r, 
               input wire [ 63 : 0 ] x, 
               input wire [ 79 : 0 ] k );

  // Stage 1: complete this module implementation
  wire [63:0] data1, data2;

  key_addition add_key (.r(data1[63:0]) , .x(x[63:0]) , .k(k[79:0]));
  
  genvar i;
  generate
    for (i = 0; i < 64; i = i + 4) begin: sbox_loop
      sbox sbox_key (.r(data2[i+3:i]), .x(data1[i+3:i]));
    end
  endgenerate

  perm perm_key (.r(r[63:0]) , .x(data2[63:0]));

endmodule
