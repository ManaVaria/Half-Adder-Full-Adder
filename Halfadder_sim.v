`timescale 1ns / 1ps
module Halfadder_sim();
reg t_a,t_b;
wire sum,carry;
Halfadder dut( 
.a(t_a),
.b(t_b),
.sum(sum),
.carry(carry)
);

initial begin
t_a=0; t_b=0; #10;
t_a=0; t_b=1; #10;
t_a=1; t_b=0; #10;
t_a=1; t_b=1; #10;
$stop;
end
endmodule
