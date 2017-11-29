module DI
(
a,
//b,
quotient,remainder
);

input[14:0] a;


output reg [14:0] quotient;
output reg [14:0] remainder;

//parameter a=31'd62;
parameter b=15'd16;

reg[14:0] tempa;
reg[14:0] tempb;
reg[29:0] temp_a;
reg[29:0] temp_b;

integer i;

always @(a or b)
begin
tempa <= a;
tempb <= b;
end

always @(tempa or tempb)
begin
temp_a = {15'h00000000,tempa};
temp_b = {tempb,15'h00000000};
for(i = 0;i < 15;i = i + 1)
begin
temp_a = {temp_a[28:0],1'b0};
if(temp_a[29:15] >= tempb)
temp_a = temp_a - temp_b + 1'b1;
else
temp_a = temp_a;
end

quotient <= temp_a[14:0];
remainder <= temp_a[29:15];
end

endmodule