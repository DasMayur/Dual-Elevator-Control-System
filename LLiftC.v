module LLiftC(clk,reset,req_floor,stop,door,Up,Down,out1,out2);

input clk,reset;     

//cf=current floor

input [3:0] req_floor;
output reg[1:0] door;
output reg[1:0] Up;
output reg[1:0] Down;
output reg[1:0] stop;
output [3:0] out1;
output [3:0] out2;

wire[3:0] y1;
wire[3:0] y2;
reg[3:0] cf;
reg[3:0] l1 = 3'd0;
reg[3:0] l2 = 3'd0;

always @ (posedge clk)
begin
   if(((l2 > l1) && (l1 > req_floor)) || ((req_floor > l1) && (l1 > l2)))
	   cf = l1;
	else if(((l1 > l2) && (l2 > req_floor)) || ((req_floor > l2) && (l2 > l1)))
	   cf = l2;   
	else if((l1 > req_floor) && (req_floor > l2))
	begin
	   if((l1 - req_floor) > (req_floor - l2)) 
		   cf = l2;
		else 
		   cf = l1;
	end
	
	else if((l2 > req_floor) && (req_floor > l1))
	begin
	   if((l2 - req_floor) > (req_floor - l1))
		   cf = l1;
		else 
		   cf = l2;
	end
	else if(l1 == l2)
	   cf = l1;
	
	
	if(reset)
   begin
      cf=3'd0;
      stop=2'd1;
      door = 1'd1;
      Up=1'd0;
      Down=1'd0;
   end
   else
   begin
      if(req_floor < 3'd8)
      begin
         if(req_floor < cf )
         begin
            cf=cf-1;
            door=1'd0;
            stop=2'd0;
            Up=1'd0;
            Down=1'd1;
         end

         else if (req_floor > cf)
         begin
            cf = cf+1;
            door=1'd0;
            stop=2'd0;
            Up=1'd1;
            Down=1'd0;
         end

         else if(req_floor == cf )
         begin
            cf = req_floor;
            door=1'd1;
            stop=2'd1;
            Up=1'd0;
            Down=1'd0;
         end
      end
   end
	if(((l2 > l1) && (l1 > req_floor)) || ((req_floor > l1) && (l1 > l2)))
	   l1 = cf;
	else if(((l1 > l2) && (l2 > req_floor)) || ((req_floor > l2) && (l2 > l1)))
	   l2 = cf;
	else if((l1 > req_floor) && (req_floor > l2))
	begin
	   if((l1 - req_floor) > (req_floor - l2)) 
		   l2 = cf;
		else 
		   l1 = cf;
	end
	else if((l2 > req_floor) && (req_floor> l1))
	begin
	   if((l2 - req_floor) > (req_floor - l1)) 
		   l1 = cf;
		else 
		   l1 = cf;
	end
	else if(l1 == l2)
	      l1 = cf;
	
end

assign y1 = l1;
assign y2 = l2;

seven_segment lift1 (y1,out1);
seven_segment lift2 (y2,out2);



endmodule



module seven_segment(i,seven);
input [0:3]i;
output reg[0:6] seven;

always @(*)
	begin
		case(i)
			4'b0000:seven=7'b0000001;
			4'b0001:seven=7'b1001111;
			4'b0010:seven=7'b0010010;
			4'b0011:seven=7'b0000110;
			4'b0100:seven=7'b1001100;
			4'b0101:seven=7'b0100100;
			4'b0110:seven=7'b0100000;
			4'b0111:seven=7'b0001111;
			4'b1000:seven=7'b0000000;
			4'b1001:seven=7'b0000100;
		endcase
	end
endmodule
