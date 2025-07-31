/* Copyright (C) 2017 Daniel Page <csdsp@bristol.ac.uk>
 *
 * Use of this source code is restricted per the CC BY-NC-ND license, a copy of 
 * which can be found via http://creativecommons.org (and should be included as 
 * LICENSE.txt within the associated archive or repository).
 */

module sbox ( output wire [ 3 : 0 ] r,
                input wire [ 3 : 0 ] x );

    // Stage 1: complete this module implementation
    wire a,b,c,d;
    assign a = x[3];
    assign b = x[2];
    assign c = x[1];
    assign d = x[0];
   
    assign r[3] =  (~a & ~c & ~d) | (a & ~b & d) | (a & ~b & c) | (~a & c & d) | (~a & b & ~d);
    assign r[2] = (~a & b & c & d) | (~b & c & ~d) | (a & b & ~c) | (~a & ~b & ~c) | (~b & ~c & d);
    assign r[1] = (~a & ~b & c) | (~a & c & ~d) | (a & b & d) | (a & ~b & ~c) | (~b & c & ~d);
    assign r[0] = (~a & ~b & d) | (~a & b & ~c & ~d) | (~a & c & d) | (a & ~b & ~d) | (a & b & ~c & d) | (a & c & ~d);
    
endmodule     
