//module D(data,clk,rst,inb,inc,usedw,usedw_b,outa,outb,rdreq,wrreq,rdreq_b,wrreq_b,outca,outcb,out);
module D(clk,rst,inb,inc,usedw,usedw_b,outa,outb,rdreq,wrreq,rdreq_b,wrreq_b,outca,outcb,out);
input clk,rst;
//input  [7:0] inb,inc,data;
input  [7:0] inb,inc;
input [1:0] usedw,usedw_b;
output [7:0] outa,outb,outca,outcb;
output   rdreq,wrreq,rdreq_b,wrreq_b;
output 	[14:0] out;
reg 	[14:0] out;
reg rdreq,wrreq,rdreq_b,wrreq_b;
reg   [7:0] outa1,outa2,outb1,outb2,outc1,outc2;
reg [7:0]	data;

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
data<=8'b0;
else
data<=data+1'b1;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
wrreq<=1'b0;
else if(outa1!=8'b0)
wrreq<=1'b1;
else
wrreq<=wrreq;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
rdreq<=1'b0;
else if(usedw==8'd3)
rdreq<=1'b1;
else
rdreq<=rdreq_b;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
wrreq_b<=1'b0;
else if(outb1!=8'b0)
wrreq_b<=1'b1;
else
wrreq_b<=wrreq_b;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
rdreq_b<=1'b0;
else if(usedw_b==8'd3)
rdreq_b<=1'b1;
else
rdreq_b<=rdreq_b;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
outa1<=8'b0;
else
outa1<=data;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
outa2<=8'b0;
else
outa2<=outa1;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
outb1<=8'b0;
else 
outb1<=inb;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
outb2<=8'b0;
else
outb2<=outb1;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
outc1<=8'b0;
else 
outc1<=inc;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
outc2<=8'b0;
else
outc2<=outc1;
end

always@(posedge clk or negedge rst)
begin
if(!rst)
out <= 8'b0;
else
begin
out <= (data*A) + (outa1*B) + (outa2*C) + (inb*D) + (outb1*E) + (outb2*F) + (inc*G) + (outc1*H) + (outc2*I);
end
end

assign outa=outa2;
assign outb=outb2;
assign outca=outc1;
assign outcb=outc2;
endmodule