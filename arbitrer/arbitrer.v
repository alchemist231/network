// port1 in general Self_injection

module arbitrer(port1, port2, port3, port4, port2_block, port3_block, port4_block, mux_select);

	input wire port1,port2,port3,port4;
	output wire port2_block,port3_block,port4_block;
	output reg [1:0] mux_select;

	assign port4_block = port1 | port2 | port3;
	assign port3_block = port1 | port2;
	assign port2_block = port1;

	always@(port1, port2, port3, port4)
	begin
		if (port1)
			begin
				mux_select <= 2'b00;
			end
		else if (port2)
			begin
				mux_select <= 2'b01;
			end
		else if (port3)
			begin
				mux_select <= 2'b10;
			end
		else 
			begin
				mux_select <= 2'b11;
			end
	end

endmodule