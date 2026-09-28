`timescale 1ns / 1ps
module full_adder(
input a,b,cin,
output sum,carry
    );
    
    wire s1,c1,c2;
    Halfadder HA1(a,b,s1,c1);
    Halfadder HA2(s1,cin,sum,c2);
    assign carry=c1|c2;
endmodule
