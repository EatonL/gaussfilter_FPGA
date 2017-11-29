module O(clk,rst,out,tureOut,rdreq);
//module O(clk,rst,rdreq);

input clk,rst,rdreq;
input [14:0] out;
output [14:0] tureOut;
//input out;
//output tureOut;
reg [8:0] cnt;
reg [14:0] mid,tureOut;

//reg [14:0] out;
//reg [14:0] tureOut;

parameter right = 9'd300;
parameter left = 9'd1;

always@(posedge clk or negedge rst)
begin
	if(!rst)
		cnt <= 9'b0;
	else
	begin
		if ((rdreq==1'd1)&&(cnt <= 9'd298))
			cnt <= cnt + 1'd1;
		else if (cnt > 9'd298)
			cnt <= 9'd0;
			end
end

always@(posedge clk or negedge rst)
begin
	if(!rst)
		tureOut <= 14'd0;
	else if ((cnt >= 9'd0) && (cnt <= 9'd298))begin
			mid <= out;
			tureOut <= mid;
			end
end

endmodule