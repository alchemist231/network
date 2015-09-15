module arbitrer(port1, port2, port3,self_injection, port1_block, port2_block, port3_block, mux_select);

	input wire port1,port2,port3,self_injection;
	output wire port1_block,port2_block,port3_block;
	output wire [1:0] mux_select;

	assign port3_block = self_injection & (port3 & (port1 | port2));
	assign port2_block = self_injection & port1 & port2;
	assign port3_block = self_injection;

	always@(port1, port2, port3, self_injection)
	begin
		if (self_injection)
			begin
				mux_select <= 2'b00;
			end
		else if (port1)
			begin
				mux_select <= 2'b01;
			end
		else if (port2)
			begin
				mux_select <= 2'b10;
			end
		else 
			begin
				mux_select <= 2'b11;
			end
	end

endmodule