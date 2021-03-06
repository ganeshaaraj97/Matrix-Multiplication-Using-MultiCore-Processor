module instr_memory(
			input clock,
			input [ 15: 0] addr_a,
			input [ 15: 0] addr_b,
			input [ 15: 0] addr_c,
			input [ 15: 0] addr_d, 
			output reg [ 15: 0] instr_out_a,
			output reg [ 15: 0] instr_out_b,
			output reg [ 15: 0] instr_out_c,
			output reg [ 15: 0] instr_out_d);
			reg [ 15: 0] ram [ 94: 0];
			parameter
		   loada = 16'd3,
			loadb = 16'd5,
			store = 16'd7,
			jumpz = 16'd9,
			jumpn = 16'd13,
			mvr2r1 = 16'd20,
			//enaa = 16'd11,
			//enab = 16'd14,
			//enac = 16'd17,
			//enad = 16'd20,
			mvacarp = 16'd23,
			mvacacp = 16'd24,
			mvacbcp = 16'd25,
			incam = 16'd26,
			incan = 16'd27,
			incbn = 16'd28,
			mvamr1 = 16'd29,
			mvanr1 = 16'd30,
			mvbnr1 = 16'd31,
			mvarpac = 16'd32,
			mvacpac = 16'd33,
			mvbcpac = 16'd34,
			mvaaac = 16'd35,
			mvabac = 16'd36,
			mvadac = 16'd37,
			mvacr1 = 16'd38,
			mvacr2 = 16'd39,
			mvr2ac = 16'd40,
			multi = 16'd41,
			add = 16'd42,
			sub = 16'd43,
			rstan = 16'd45,
			rstr2 = 16'd46,
			nop = 16'd47,
			endop = 16'd48;
			///idle = 16'd48;
			
			initial begin
			
					ram[0] = 16'd4096+loada;/////////////////// 1st core
					ram[1] = 16'd0;//hv to change according to data_memory values
					ram[2] = 16'd4096+mvacarp;
					ram[3] = 16'd4096+loada; 
					ram[4] = 16'd2; 
					ram[5] = 16'd4096+mvacacp; 
					ram[6] = 16'd4096+loada; 
					ram[7] = 16'd2; 
					ram[8] = 16'd4096+mvacbcp;
			      ram[9] = 16'd4096+nop;		
					//ram[10] = 16'd4096+incam;
					ram[10] = 16'd4096+mvamr1;
					ram[11] = 16'd4096+mvarpac;
					ram[12] = 16'd4096+sub;
					ram[13] = 16'd4096+jumpz;
					ram[14] = 16'd87;
					ram[15] = 16'd8192+loada;//////2nd core
					ram[16] = 16'd0; 
					ram[17] = 16'd8192+mvacarp;
					ram[18] = 16'd8192+loada; 
					ram[19] = 16'd1; 
					ram[20] = 16'd8192+mvacacp; 
					ram[21] = 16'd8192+loada; 
					ram[22] = 16'd2; 
					ram[23] = 16'd8192+mvacbcp;	
					ram[24] = 16'd8192+incam;
					//ram[26] = 16'd8192+incam;
					ram[25] = 16'd8192+mvamr1;
					ram[26] = 16'd8192+mvarpac;
					ram[27] = 16'd8192+sub;
					ram[28] = 16'd8192+jumpz;
					ram[29] = 16'd88;
					ram[30] = 16'd16384+loada;////3rd core
					ram[31] = 16'd0; 
					ram[32] = 16'd16384+mvacarp;
					ram[33] = 16'd16384+loada; 
					ram[34] = 16'd1; 
					ram[35] = 16'd16384+mvacacp; 
					ram[36] = 16'd16384+loada; 
					ram[37] = 16'd2; 
					ram[38] = 16'd16384+mvacbcp;		
					ram[39] = 16'd16384+incam;
					ram[40] = 16'd16384+incam;
					//ram[43] = 16'd16384+incam;
					ram[41] = 16'd16384+mvamr1;
					ram[42] = 16'd16384+mvarpac;
					ram[43] = 16'd16384+sub;
					ram[44] = 16'd16384+jumpz;
					ram[45] = 16'd89;
					ram[46] = 16'd32768+loada;/////4th core
					ram[47] = 16'd0; 
					ram[48] = 16'd32768+mvacarp;
					ram[49] = 16'd32768+loada; 
					ram[50] = 16'd1; 
					ram[51] = 16'd32768+mvacacp; 
					ram[52] = 16'd32768+loada; 
					ram[53] = 16'd2; 
					ram[54] = 16'd32768+mvacbcp;		
					ram[55] = 16'd32768+incam;
					ram[56] = 16'd32768+incam;
					ram[57] = 16'd32768+incam;
					//ram[61] = 16'd32768+incam;
					ram[58] = 16'd32768+mvamr1;
					ram[59] = 16'd32768+mvarpac;
					ram[60] = 16'd32768+sub;
					ram[61] = 16'd32768+jumpz;
					ram[62] = 16'd90;
					ram[63] = 16'd61440+mvaaac;//// all core
					ram[64] = 16'd61440+loadb;
					ram[65] = 16'd61440+mvacr1;
					ram[66] = 16'd61440+mvabac;
					ram[67] = 16'd61440+loadb;
					ram[68] = 16'd61440+multi;
					ram[69] = 16'd61440+mvr2r1;
					ram[70] = 16'd61440+add;
					ram[71] = 16'd61440+mvacr2;
					ram[72] = 16'd61440+incan;
					ram[73] = 16'd61440+mvanr1; 
					ram[74] = 16'd61440+mvacpac;
					ram[75] = 16'd61440+sub ;
					ram[76] = 16'd61440+jumpn;////better to go with jumpz
					ram[77] = 16'd63;
					ram[78] = 16'd61440+store;
					ram[79] = 16'd61440+incbn; 
					ram[80] = 16'd61440+rstan;
					ram[81] = 16'd61440+rstr2;  
					ram[82] = 16'd61440+mvbnr1;
					ram[83] = 16'd61440+mvbcpac; 
					ram[84] = 16'd61440+sub;
					ram[85] = 16'd61440+jumpn;
					ram[86] = 16'd63;
					ram[87] = 16'd4096+endop;
					ram[88] = 16'd8192+endop;
					ram[89] = 16'd16384+endop;
					ram[90] = 16'd32768+endop;
					
			end
			always @(posedge clock)
					begin
							instr_out_a <= ram[addr_a] ;
							instr_out_b <= ram[addr_b] ;
							instr_out_c <= ram[addr_c] ;
							instr_out_d <= ram[addr_d] ;
				   end
endmodule

//module instr_tb();
//	reg clock;
//	reg [ 15: 0] addr_a;
//	reg [ 15: 0] addr_b;
//	reg [ 15: 0] addr_c;
//	reg [ 15: 0] addr_d;
//	wire [15:0] instr_out_a;
//	wire [15:0] instr_out_b;
//	wire [15:0] instr_out_c;
//	wire [15:0] instr_out_d;
//  
//  instr_memory dut (.clock(clock), .addr_a(addr_a), .addr_b(addr_b), .addr_c(addr_c), .addr_d(addr_d), .instr_out_a(instr_out_a), .instr_out_b(instr_out_b), .instr_out_c(instr_out_c), .instr_out_d(instr_out_d));
//
//  initial begin
//  #50;
//  clock = 1'd0; addr_a   = 16'd1; addr_b = 16'd5; addr_c = 16'd8; addr_d = 16'd9; #100;
//  clock = 1'd1; addr_a   = 16'd1; addr_b = 16'd5; addr_c = 16'd8; addr_d = 16'd9; #100;
//  clock = 1'd0; addr_a   = 16'd80; addr_b = 16'd81; addr_c = 16'd82; addr_d = 16'd83; #100;
//  clock = 1'd1; addr_a   = 16'd80; addr_b = 16'd81; addr_c = 16'd82; addr_d = 16'd83; #100;
//  
//
//  
//  end
//  
//  //always begin
//    //#50;
//	 //clock = ~clock;
//  //end
//  
//endmodule