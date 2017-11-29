module G(clk,in1,in2,in3,in4,in5,in6,in7,in8,in9,out);

input clk;
input [7:0] in1,in2,in3,in4,in5,in6,in7,in8,in9;
output [7:0] out;

parameter A = 3'd1;
parameter B = 3'd2;
parameter C = 3'd1;
parameter D = 3'd2;
parameter E = 3'd4;
parameter F = 3'd2;
parameter G = 3'd1;
parameter H = 3'd2;
parameter I = 3'd1;

always@(posedge clk or negedge rst)
begin
if(!rst)
out <= 8'b0;
else
out <= in1*A + in2*B + in3*C + in4*D + in5*E + in6*F + in7*G + in8*H + in9*I;
end