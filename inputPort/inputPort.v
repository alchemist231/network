// In general Self on port 1

//`include "routing/"
//`include "demultiplexer/"

module inputPort(flit, routerAddress, portBlock, outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4);

	parameter flitWidth = 12 ;
	parameter modifiedFlitSize = 14 ;
	parameter router_add_size  = 4;
	parameter headerWidth      = 4;
	parameter modifiedHeaderWidth = 6;
	parameter messageSize =	8	;
 
	input wire [flitWidth-1:0] flit;
	input wire [router_add_size-1:0] routerAddress;
	input wire portBlock;
	output wire [modifiedFlitSize-1:0] outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4;

	wire [modifiedFlitSize-1:0] modifiedFlit;
	wire [headerWidth-1:0] header;
	wire [modifiedHeaderWidth-1:0] modifiedHeader;
	wire [messageSize-1:0] message;
	reg [1:0] portAddress;

	assign header = flit[flitWidth-1:flitWidth-headerWidth];
	assign message = flit[flitWidth-headerWidth:0];

	x_y_routing route(header, routerAddress, portAddress, modifiedHeader);

	assign modifiedFlit={modifiedHeader,message};

	demultiplexerFlit_1x4 demux(modifiedHeader[modifiedHeaderWidth-1:modifiedHeaderWidth-2], modifiedFlit, outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4);

	initial begin
		portAddress <= 2'b11;
	end

endmodule


