module regrinc(clock,write_en,datain,dataout,inc_en);
	
	input clock,write_en,inc_en; 
	
	input [15:0] datain; 
	
	output reg [15:0] dataout=16'd0;
	
	always @(posedge clock) 
	
		begin 
	
		if (write_en == 1) 
			dataout <= datain; 
		if (inc_en == 1) 
			dataout <= dataout + 16'd1; 
//			$display("[display] time=%0t pc_out=%0d",$time,dataout);
	end 
endmodule