// In general Self on port 1

`include "routing/"
`include "demultiplexer/"

module inputPort(flit, routerAddress, portBlock, outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4);

	parameter flitWidth = ;
	parameter modifiedFlitSize = ;
	parameter router_add_size  = ;
 
	input wire [flitWidth-1:0] flit;
	input wire [router_add_size-1:0] routerAddress;
	input wire portBlock;
	output wire [modifiedFlitSize-1:0] outFlitPort1, outFlitPort2, outFlitPort3, outputFlit4;

	wire [modifiedFlitSize-1:0] modifiedFlit;
	reg portAddress

	x_y_routing route(flit, routerAddress, portAddress, modifiedFlit);

	demultiplexerFlit_1x4 demux(select, modifiedFlit, outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4);



