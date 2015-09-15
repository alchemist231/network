module headerGenerator(address, header);

	parameter address_size = ;
	parameter header_size  = ;

	input wire [address_size-1:0] address;
	output wire [header_size-1:0] header ;

	assign header = address;

endmodule