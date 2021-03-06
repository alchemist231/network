//`include "util/"
//`include "multiplexer/"

module x_y_routing(header, router_address, port_address, modifiedHeader);

	parameter modifiedHeader_size = 6;
	parameter header_size 		  = 4;
	parameter dest_address_size   = 4;
	parameter router_address_size = 4;


	input wire [header_size-1:0] header;
	input wire [router_address_size-1:0] router_address;
	input wire [1:0] port_address;
	output wire [modifiedHeader_size-1:0] modifiedHeader;

	wire [dest_address_size-1:0] destination_address;
	wire x_equal, x_less, x_greater;
	wire y_equal, y_less, y_greater;

	// dir1 --> north, dir2--> east, dir3--> south, dir4--> west
	wire dir1, dir2, dir3, dir4, self;
	wire [1:0] route_direction, route;


	assign destination_address = header[dest_address_size-1:0];


	// x first routing, y later

	comparator x_comp(destination_address[3:2], router_address[3:2], x_equal, x_less, x_greater);
	comparator y_comp(destination_address[1:0], router_address[1:0], y_equal, y_less, y_greater);

	assign dir1 = x_equal&y_greater;
	assign dir2 = x_greater;
	assign dir3 = x_equal&y_less;
	assign dir4 = x_less; 
	assign self = x_equal&y_equal;

	encoder direction(dir1, dir2, dir3, dir4, route_direction);

	mux_2x1_bus m1(route_direction, port_address, self, route);

	assign modifiedHeader = {route,header};

endmodule
