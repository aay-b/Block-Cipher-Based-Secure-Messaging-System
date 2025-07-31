/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module key_schedule( output wire [ 79 : 0 ] r,
                      input wire [ 79 : 0 ] x,
                      input wire [  4 : 0 ] i );

  // Stage 1: complete this module implementation

  wire [79:0] kdata1, kdata2;

  assign kdata1 = {x[18:0], x[79:19]};
  assign kdata2[14:0] = kdata1[14:0];
  assign kdata2[19:15] = kdata1[19:15] ^ i;
  assign kdata2[75:20] = kdata1[75:20];

  sbox SBOXKEY (.r(kdata2[79:76]), .x(kdata1[79:76]));
  assign r[14:0] = kdata2[14:0];
  assign r[19:15] = kdata2[19:15]; 
  assign r[75:20] = kdata2[75:20];
  assign r[79:76] = kdata2[79:76];

endmodule
