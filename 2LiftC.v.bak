module 2LiftC(clk,reset,req_floor,stop,door,Up,Down,y1,y2);

input clk,reset;

input [6:0] req_floor;
output reg[1:0] door;
output reg[1:0] Up;
output reg[1:0] Down;
output reg[1:0] stop;

output [6:0] y1;
output [6:0] y2;
reg [6:0] cf;
reg [6:0] l1;
reg [6:0] l2;
always @ (posedge clk)
begin
   if((l2 > l1 > req_floor) || (req_floor > l1 > l2))
	   cf = l1;
	else if((l1 > l2 > req_floor) || (req_floor > l2 > l1))
	   cf = l2;
	else if(l1 > req_floor > l2)
	begin
	   if(l1 - req_floor > req_floor - l2) 
		   cf = l2;
		else 
		   cf = l1;
	end
	else if(l2 > req_floor > l1)
	begin
	   if(l2 - req_floor > req_floor - l1) 
		   cf = l1;
		else 
		   cf = l2;
	end
	
	if(reset)
   begin
      cf=6'd0;
      stop=6'd1;
      door = 1'd1;
      Up=1'd0;
      Down=1'd0;
   end
   else
   begin
      if(req_floor < 6'd61)
      begin
         if(req_floor < cf )
         begin
            cf=cf-1;
            door=1'd0;
            stop=6'd0;
            Up=1'd0;
            Down=1'd1;
         end

         else if (req_floor > cf)
         begin
            cf = cf+1;
            door=1'd0;
            stop=6'd0;
            Up=1'd1;
            Down=1'd0;
         end

         else if(req_floor == cf )
         begin
            cf = req_floor;
            door=1'd1;
            stop=6'd1;
            Up=1'd0;
            Down=1'd0;
         end
      end

if((l2 > l1 > req_floor) || (req_floor > l1 > l2))
	   l1 = cf;
	else if((l1 > l2 > req_floor) || (req_floor > l2 > l1))
	   l2 = cf;
	else if(l1 > req_floor > l2)
	begin
	   if(l1 - req_floor > req_floor - l2) 
		   l2 = cf;
		else 
		   l1 = cf;
	end
	else if(l2 > req_floor > l1)
	begin
	   if(l2 - req_floor > req_floor - l1) 
		   l1 = cf;
		else 
		   l1 = cf;
	end
end
end

assign y1 = l1;
assign y2 = l2;

endmodule

