/*
`include "arbitrer/"
`include "multiplexer/"
`include "buffer/"
`include "detectInput/"
*/


module outputPort(data1, data2, data3, data4, portBlock1, portBlock2, portBlock3, portBlock4, outputData);

	parameter flitWidth = 12;
	parameter flitWidthModified = 14;
	parameter modifiedHeaderWidth = 6;
	parameter headerWidth = 4;

	input wire [flitWidthModified-1:0] data1, data2, data3, data4;
	output wire portBlock1, portBlock2, portBlock3, portBlock4;
	output wire [flitWidth-1:0] outputData;

	wire [1:0] header1, header2, header3, header4;
	wire [flitWidth-1:0] flit1, flit2, flit3, flit4;
	wire port1_present, port2_present, port3_present, port4_present; 
	wire [1:0] mux_select;

	reg [1:0] address;

	assign header1 = data1[flitWidthModified-1:flitWidth];
	assign header2 = data2[flitWidthModified-1:flitWidth];
	assign header3 = data3[flitWidthModified-1:flitWidth];
	assign header4 = data4[flitWidthModified-1:flitWidth];

	assign flit1 = data1[flitWidth-1:0];
	assign flit2 = data2[flitWidth-1:0];
	assign flit3 = data3[flitWidth-1:0];
	assign flit4 = data4[flitWidth-1:0];

	
	detectInput detector(header1, header2, header3, header4, address, port1_present, port2_present, port3_present, port4_present);

	arbitrer portArbitrer(port1_present, port2_present, port3_present, port4_present, portBlock2, portBlock3, portBlock4, mux_select);

	mux_flit_4x1 mux(flit1, flit2, flit3, flit4, mux_select, outputData);

	initial 
	begin
		address <= 2'b01 ;
	end

endmodule