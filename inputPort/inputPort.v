// In general Self on port 1

`include "routing/"
`include "demultiplexer/"

module inputPort(flit, routerAddress, portBlock, outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4);

	parameter flitWidth = ;
	parameter modifiedFlitSize = ;
	parameter router_add_size  = ;
	parameter headerWidth      = ;
	parameter modifiedHeaderWidth = ;
	parameter messageSize =			;
 
	input wire [flitWidth-1:0] flit;
	input wire [router_add_size-1:0] routerAddress;
	input wire portBlock;
	output wire [modifiedFlitSize-1:0] outFlitPort1, outFlitPort2, outFlitPort3, outputFlit4;

	wire [modifiedFlitSize-1:0] modifiedFlit;
	wire [headerWidth-1:0] header;
	wire [modifiedHeaderWidth-1:0] modifiedHeader;
	wire [1:0] route;
	wire [messageSize-1:0] message;
	reg portAddress

	assign header = flit[flitWidth-1:flitWidth-headerWidth+1];
	assign message = flit[flitWidth-headerWidth:0];

	x_y_routing route(header, routerAddress, portAddress, modifiedHeader);

	assign modifiedFlit={modifiedHeader,message};

	demultiplexerFlit_1x4 demux(modifiedHeader[modifiedHeaderWidth-1:modifiedHeaderWidth-2], modifiedFlit, outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4);

endmodule


