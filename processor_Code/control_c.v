module control_c(
	input clock,
	input [15:0] z,
	input [ 1: 0] status,
	input [ 15: 0] instruction,
	output reg [ 2: 0] alu_op,
	output reg [ 15: 0] write_en,
	output reg [ 3: 0] read_en,
	output reg [ 2: 0] rst,
	output reg [ 15: 0] inc_en,
	output reg mem_wr,
	output reg end_process);
	
	reg [ 5: 0] present = 6'd0;
	reg [ 5: 0] next = 6'd0;
	parameter fetch1 = 6'd1,
	fetch2 = 6'd2,
	loada1 = 6'd3,
	loada2 = 6'd4,
	//loada3 = 6'd5,
	loadb1 = 6'd5,
	loadb2 = 6'd6,
	store1 = 6'd7,
	store2 = 6'd8,
	jumpz1 = 6'd9,
	jumpz2 = 6'd10,
	jumpz3 = 6'd11,
	fetch1x = 6'd50,
	fetch2x = 6'd51,
	loada1x = 6'd52,
	loada2x = 6'd53,
	loadb1x = 6'd54,
	loadb2x = 6'd55,
	loadb3x = 6'd56,
	jumpz3x = 6'd57,
	sub1x = 6'd58,
	sub2x = 6'd59,
	jumpz2x = 6'd60,
	multi1x = 6'd61,
	add1x = 6'd62,
	
	
	
	jumpn1 = 6'd13,
	jumpn2 = 6'd14,
	jumpn3 = 6'd15,
	jumpn2x = 6'd16,
	jumpn3x = 6'd17,
	store1x = 6'd18,
	store2x = 6'd19,
	mvr2r1 = 6'd20,
	mvr2r1x = 6'd21,
	
	//enaa1 = 6'd10,
	//enaa2 = 6'd11,
	//enaa3 = 6'd12,
	//enab1 = 6'd13,
	//enab2 = 6'd14,
	///enab3 = 6'd15,
	//enac1 = 6'd16,
	///enac2 = 6'd17,
	//enac3 = 6'd18,
	//enad1 = 6'd19,
	//enad2 = 6'd20,
	//enad3 = 6'd21,
	mvacarp = 6'd23,
	mvacacp = 6'd24,
	mvacbcp = 6'd25,
	incam = 6'd26,
	incan = 6'd27,
	incbn = 6'd28,
	mvamr1 = 6'd29,
	mvanr1 = 6'd30,
	mvbnr1 = 6'd31,
	mvarpac = 6'd32,
	mvacpac = 6'd33,
	mvbcpac = 6'd34,
	mvaaac = 6'd35,
	mvabac = 6'd36,
	mvadac = 6'd37,
	mvacr1 = 6'd38,
	mvacr2 = 6'd39,
	mvr2ac = 6'd40,
	multi = 6'd41,
	add = 6'd42,
	sub = 6'd43,
	rstan = 6'd45,
	rstr2 = 6'd46,
	nop = 6'd47,
	endop = 6'd48,
	idle = 6'd0;
	always @(posedge clock)
	present <= next;
	always @(posedge clock)
			begin
			if (present == endop)
			end_process <= 1'd1;
			else
			end_process <= 1'd0;
			end
	always @(present or instruction or status or z)
	         //$monitor("write_en",write_en);
				if (instruction[15:12] == 4'd4 || instruction[15:12] == 4'd15)
						//$display("instr=%b",instruction);;
						begin
								$display("[display] time=%0t instruction_c=%0d",$time,instruction);
								//$display("[display] time=%0t z=%0d",$time,z);
								case(present)
								
											idle: begin
											mem_wr <= 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											if (status == 2'b01)
											next <= fetch1;
											else
											next <= idle;
											end
											
											fetch1: begin
											mem_wr <= 1'd0;
											read_en <= 4'd15;
											rst <=3'b000;
											write_en <= 16'b00000000000001000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1x;
											//$display("fetch=%b",read_en);
											end
											
											fetch1x: begin
											mem_wr <= 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch2;
											end
											
											fetch2: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000100;
											alu_op <= 3'd0;
											next <= fetch2x;
											end
											
											fetch2x: begin
											mem_wr <= 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= instruction[5:0];
											end
											
											loada1: begin
											mem_wr <= 1'd0;
											read_en <= 4'd15;
											rst <=3'b000;
											write_en <= 16'b00000000000000001;
											inc_en <= 16'b0000000000000100;
											alu_op <= 3'd0;
											next <= loada2;
											end
											
//											loada1x: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd0;
//											rst <=3'b000;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= loada2;
//											end
											
				
											loada2: begin // ac to bus bus to
											mem_wr = 1'd0;
											read_en <= 4'd14;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvr2r1: begin // ac to bus bus to
											mem_wr = 1'd0;
											read_en <= 4'd2;
											rst <=3'b000;
											write_en <= 16'b0000010000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
//											mvr2r1x: begin // ac to bus bus to
//											mem_wr = 1'd0;
//											read_en <= 4'd0;
//											rst <=3'b000;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
											
//											loada2x: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd0;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
											
											loadb1: begin
											mem_wr = 1'd0;
											read_en <= 4'd12;
											rst <=3'b000;
											write_en <= 16'b0000000000000001;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= loadb1x;
											end
											
											loadb1x: begin
											mem_wr <= 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= loadb2;
											end
											
											loadb2: begin
											mem_wr = 1'd0;
											read_en <= 4'd14;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
//											loadb2x: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd0;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= loadb3x;
//											end
//											
//											loadb3x: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd0;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
											
											store1: begin
											mem_wr = 1'd0;
											read_en <= 4'd13;
											rst <=3'b000;
											write_en <= 16'b0000000000000001;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= store2;
											end
											
//											store1x: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd0;
//											rst <=3'b000;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= store2;
//											end
											
											store2: begin
											mem_wr = 1'd1;
											read_en <= 4'd2;
											rst <=3'b000;
											write_en <= 16'b0010000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
//											store2x: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd0;
//											rst <=3'b000;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
											
											jumpz1: begin
											mem_wr <= 1'd0;
											read_en <= 4'd15;
											rst <=3'b000;
											write_en <= 16'b0000000010000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											if (z == 0)
											next <= jumpz2;
											else
											next <= jumpz3;
											end
											
											jumpz2: begin
											mem_wr = 1'd0;
											read_en <= 4'd8;
											rst <=3'b000;
											write_en <= 16'b0000000000000100;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= jumpz2x;
											end
											
											jumpz2x: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;//pc =pc+1
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											jumpz3: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000100;//pc =pc+1
											alu_op <= 3'd0;
											next <= jumpz3x;
											end
											
											jumpz3x: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;//pc =pc+1
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											jumpn1: begin
											mem_wr <= 1'd0;
											read_en <= 4'd15;
											rst <=3'b000;
											write_en <= 16'b0000000010000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											if (z == 1)
											next <= jumpn2;
											else
											next <= jumpn3;
											end
											
											jumpn2: begin
											mem_wr = 1'd0;
											read_en <= 4'd8;
											rst <=3'b000;
											write_en <= 16'b0000000000000100;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= jumpn2x;
											end
											
											jumpn2x: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;//pc =pc+1
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											jumpn3: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000100;//pc =pc+1
											alu_op <= 3'd0;
											next <= jumpn3x;
											end
											
											jumpn3x: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;//pc =pc+1
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
//											enaa1: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd15;
//											write_en <= 16'b00000000000001000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= enaa2;
//											end
//											
//											enaa2: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd4;
//											write_en <= 16'b0000000000000001;
//											inc_en <= 16'b000000000001000;
//											alu_op <= 3'd0;
//											next <= enaa3;
//											end
//											
//											enaa3: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd14;
//											write_en <= 16'b0010000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
//											
//											enab1: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd15;
//											write_en <= 16'b00000000000001000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= enab2;
//											end
//											
//											enab2: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd4;
//											write_en <= 16'b0000000000000001;
//											inc_en <= 16'b000000000001000;
//											alu_op <= 3'd0;
//											next <= enab3;
//											end
//											
//											enab3: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd14;
//											write_en <= 16'b0010000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
//											
//											enac1: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd15;
//											write_en <= 16'b00000000000001000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= enac2;
//											end
//											
//											enac2: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd4;
//											write_en <= 16'b0000000000000001;
//											inc_en <= 16'b000000000001000;
//											alu_op <= 3'd0;
//											next <= enac3;
//											end
//											
//											enac3: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd14;
//											write_en <= 16'b0010000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
//											
//											enad1: begin
//											mem_wr <= 1'd0;
//											read_en <= 4'd15;
//											write_en <= 16'b00000000000001000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= enad2;
//											end
//											
//											enad2: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd4;
//											write_en <= 16'b0000000000000001;
//											inc_en <= 16'b000000000001000;
//											alu_op <= 3'd0;
//											next <= enad3;
//											end
//											
//											enad3: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd14;
//											write_en <= 16'b0010000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
											
											mvacarp: begin
											mem_wr = 1'd0;
											read_en <= 4'd12;
											rst <=3'b000;
											write_en <= 16'b0000000010000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvacacp: begin
											mem_wr = 1'd0;
											read_en <= 4'd12;
											rst <=3'b000;
											write_en <= 16'b0000000100000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvacbcp: begin
											mem_wr = 1'd0;
											read_en <= 4'd12;
											rst <=3'b000;
											write_en <= 16'b0000001000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											incam: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000010000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											incan: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000100000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											incbn: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000001000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvamr1: begin
											mem_wr = 1'd0;
											read_en <= 4'd5;
											rst <=3'b000;
											write_en <= 16'b0000010000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvanr1: begin
											mem_wr = 1'd0;
											read_en <= 4'd6;
											rst <=3'b000;
											write_en <= 16'b0000010000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvbnr1: begin
											mem_wr = 1'd0;
											read_en <= 4'd7;
											rst <=3'b000;
											write_en <= 16'b0000010000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvarpac: begin
											mem_wr = 1'd0;
											read_en <= 4'd8;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvacpac: begin
											mem_wr = 1'd0;
											read_en <= 4'd9;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvbcpac: begin
											mem_wr = 1'd0;
											read_en <= 4'd10;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvaaac: begin
											mem_wr = 1'd0;
											read_en <= 4'd1;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvabac: begin
											mem_wr = 1'd0;
											read_en <= 4'd3;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvadac: begin
											mem_wr = 1'd0;
											read_en <= 4'd13;
											rst <=3'b000;
											write_en <= 16'b0000100000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvacr1: begin
											mem_wr = 1'd0;
											read_en <= 4'd12;
											rst <=3'b000;
											write_en <= 16'b0000010000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											mvacr2: begin
											mem_wr = 1'd0;
											read_en <= 4'd12;
											rst <=3'b000;
											write_en <= 16'b0000000000000010;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											multi: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd1;
											next <= multi1x;
											end
											
											multi1x: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0001000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd1;
											next <= fetch1;
											end
											
											add: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd2;
											next <= add1x;
											end
											
											add1x: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0001000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd2;
											next <= fetch1;
											end
											
											//sub: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd0;
//											rst <=3'b000;
//											write_en <= 16'b0000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= sub1x;
//											end
											
											sub: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd3;
											next <= sub1x;
											end
											
											sub1x: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0001000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd3;
											next <= fetch1;
											end
										
//											sub2x: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd0;
//											write_en <= 16'b000000000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd3;
//											next <= fetch1;
//											end
//											
//											mvr2ac: begin
//											mem_wr = 1'd0;
//											read_en <= 4'd2;
//											write_en <= 16'b0000100000000000;
//											inc_en <= 16'b0000000000000000;
//											alu_op <= 3'd0;
//											next <= fetch1;
//											end
											
											rstan: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b001;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											rstr2: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b010;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											nop: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											endop: begin
											mem_wr = 1'd0;
											read_en <= 4'd14;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= endop;
											end
											
											default: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
								endcase
						end
				else
						begin
								$display("[display] time_1=%0t instruction_1_c=%0d",$time,instruction);
								case(present)
								
											idle: begin
											mem_wr <= 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											if (status == 2'b01)
											next <= fetch1;
											else
											next <= idle;
											end
											
											fetch1: begin
											mem_wr <= 1'd0;
											read_en <= 4'd15;
											rst <=3'b000;
											write_en <= 16'b00000000000001000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1x;
											end
											
											fetch1x: begin
											mem_wr <= 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch2;
											end
											
											fetch2: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000100;
											alu_op <= 3'd0;
											next <= nop;
											end
											
											nop: begin
											mem_wr = 1'd1;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
											
											default: begin
											mem_wr = 1'd0;
											read_en <= 4'd0;
											rst <=3'b000;
											write_en <= 16'b0000000000000000;
											inc_en <= 16'b0000000000000000;
											alu_op <= 3'd0;
											next <= fetch1;
											end
								endcase
						end
				//end
											
											
											
endmodule

