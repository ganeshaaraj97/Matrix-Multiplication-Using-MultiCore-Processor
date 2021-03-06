module control_tb();
	reg clock;
	reg [15:0] z;
	reg [ 1: 0] status;
	reg [ 15: 0] instruction;
	wire [ 2: 0] alu_op;
	wire [ 15: 0] write_en;
	wire [ 2: 0] rst;
	wire [ 15: 0] inc_en;
	wire [ 3: 0] read_en;
	wire mem_wr;
	wire end_process;
  
  control_a dut (.clock(clock),. z(z), .status(status), .instruction(instruction), .alu_op(alu_op), .write_en(write_en),. rst(rst), .inc_en(inc_en), .read_en(read_en), .mem_wr(mem_wr), .end_process(end_process));

  initial begin
  #50;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4101;#100;

  
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4124;#100;
  
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd4141;#100;
  
  
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd0; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  clock = 1'd1; z=16'd0 ;status = 2'b01;instruction  = 16'd61476;#100;
  //clock = 1'd0; status = 2'b01;instruction  = 16'd39;#100;
  //clock = 1'd1; status = 2'b01;instruction  = 16'd39;#100;
  //clock = 1'd0; status = 2'b01;instruction  = 16'd39;#100;
  //clock = 1'd1; status = 2'b01;instruction  = 16'd39;#100;
  

  
  end
  
  //always begin
    //#50;
	 //clock = ~clock;
  //end
  
endmodule
