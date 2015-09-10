module arbitrer(port1, port2, port3, port1_block, port2_block, port3_block, mux_select);

	input wire port1,port2,port3;
	output wire port1_block,port2_block,port3_block;
	output wire [1:0] mux_select;

endmodule