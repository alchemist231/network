// In general port1 selfInjection

module detectInput(header1, header2, header3, header4, address, port1, port2, port3, port4);

	parameter headerWidth = 6;

	input wire [1:0] header1, header2, header3, header4;
	output wire port1, port2, port3, port4;
	input wire [1:0] address;

	// address denotes North/South/East/West of router

	assign port1 = &(header1^~address);
	assign port2 = &(header2^~address);
	assign port3 = &(header3^~address);
	assign port4 = &(header4^~address);

	/*
	initial
	begin
		address <= ;
	end
	*/

endmodule