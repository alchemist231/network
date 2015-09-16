module routingTest();

	reg [3:0] header; 
	reg [3:0] router_address;
	reg [1:0] port_address;
	wire [5:0] modifiedHeader;


	initial
	begin
		header = 4'b1001;
		router_address =4'b1110;
		port_address=2'b10;
	end

	x_y_routing x1(header, router_address, port_address, modifiedHeader);

endmodule