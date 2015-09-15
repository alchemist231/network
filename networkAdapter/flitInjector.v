module flitInjector(message, address, flit);

	parameter message_size = ;
	parameter address_size = ;
	parameter header_size  = ;
	parameter flit_size    = ;
	// flit_size = message + header

	input wire [message_size-1:0] message;
	input wire [address_size-1:0] address;
	output wire [flit_size-1:0] flit;

	wire [header_size-1:0] header;

	headerGenerator headerGen(address,header);

	assign flit = {header,message};

endmodule


