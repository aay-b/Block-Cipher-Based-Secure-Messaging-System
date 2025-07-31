/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

`include "params.h"

module encrypt_v3(  input wire [ `N_K - 1 : 0 ]   k,
                    input wire [ `N_B - 1 : 0 ]   m,
                   output wire [ `N_B - 1 : 0 ]   c,

                    input wire                  clk );

  // Stage 4: complete this module implementation

  reg[79:0] x1, x2;
  reg [63:0] m1, m2;
  reg [79:0] key [0:31];              
  reg [63:0] rkey [0:31];  
  reg [79:0] key1 [0:31];              
  reg [63:0] rkey1 [0:31];  

  assign key1[0]=x1;
  assign rkey1[0]=m1;
  
  always @(posedge clk) begin
    x1 <= k;
    m1 <= m;
  end
  genvar i;
  generate
    for (i = 1; i <= 31; i = i + 1) begin : encryption_rounds
      always @(posedge clk) begin
        key[i-1] <= key1[i-1]; 
        rkey[i-1] <= rkey1[i-1]; 
      end

      key_schedule schedule_key (.r(key1[i]), .x(key[i-1]), .i(i[4:0]));
      round round_key (.r(rkey1[i]), .x(rkey[i-1]), .k(key[i-1]));
    end
  endgenerate

  key_addition key_addition_key (
    .r(c[63:0]),
    .x(rkey1[31]),
    .k(key1[31])
  );

endmodule

