/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v1(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c );

  // Stage 2: complete this module implementation

  wire [79:0] key1 [0:31];
  wire [63:0] rkey1 [0:31];
  assign key1[0]=k;
  assign rkey1[0]=m;
  genvar j;
  generate
    for (j = 1; j <= 31; j = j + 1) begin: key_schedule_loop
      key_schedule schedule_key (.r(key1[j]) , .x(key1[j-1]) , .i(j[4:0]));
      round round_key (.r(rkey1[j]) , .x(rkey1[j-1]) , .k(key1[j-1][79:0]));
      end
  endgenerate
  
  key_addition key_addition_key (.r(c[63:0]) , .x(rkey1[31][63:0]) , .k(key1[31][79:0]));


endmodule

