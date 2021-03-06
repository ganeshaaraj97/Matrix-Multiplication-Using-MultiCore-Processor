module bus(aa, r2, ab, ir, am, an, bn, arp, acp, bcp,ac, ad, dm, im ,read_en,clock,busout);
				input clock;
				input [ 3: 0] read_en;
				input [ 15: 0] aa;
				input [ 15: 0] r2;
				input [ 15: 0] ab;
				input [ 15: 0] ir;
				input [ 15: 0] am;
				input [ 15: 0] an;
				input [ 15: 0] bn;
				input [ 15: 0] arp;
				input [ 15: 0] acp;
				input [ 15: 0] bcp;
				//input [ 15: 0] r1;
				input [ 15: 0] ac;
				input [ 15: 0] ad;
				input [ 15: 0] dm;
				input [ 15: 0] im;
				output reg [ 15: 0] busout;
				always @(aa or r2 or ab or ir or am or an or bn or arp or acp or bcp or ac or ad or im or read_en or dm)
							begin
										case(read_en)
														4'd1: busout <= aa;
														4'd2: busout <= r2;
														4'd3: busout <= ab;
														4'd4: busout <= ir;
														4'd5: busout <= am;
														4'd6: busout <= an;
														4'd7: busout <= bn;
														4'd8: busout <= arp;
														4'd9: busout <= acp;
														4'd10: busout <= bcp;
														//4'd11: busout <= r1;
														4'd12: busout <= ac;
														4'd13: busout <= ad;
														4'd14: busout <= dm ;
														4'd15: busout <= im ;
														default: busout <= 16'd0;
										endcase
							end
endmodule