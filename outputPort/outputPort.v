`include "arbitrer/"
`include "multiplexer/"
`include "buffer/"
`include "detectInput/"


module outputPort(data1, data2, data3, data4, portBlock1, portBlock2, portBlock3, portBlock4, outputData);

	parameter flitWidth = ;
	parameter flitWidthModified = ;

	input wire [flitWidthModified-1:0] data1, data2, data3, data4;
	output wire portBlock1, portBlock2, portBlock3, portBlock4;
	output wire [flitWidth-1:0] outputData;

	wire header1, header2, header3, header4;
	wire flit1, flit2, flit3, flit4;
	wire port1_present, port2_present, port3_present, port4_present; 
	wire [1:0] mux_select;

	reg [1:0] address;

	assign header1 = data1[flitWidthModified:flitWidth+1];
	assign header2 = data2[flitWidthModified:flitWidth+1];
	assign header3 = data3[flitWidthModified:flitWidth+1];
	assign header4 = data4[flitWidthModified:flitWidth+1];

	assign flit1 = data1[flitWidth:0];
	assign flit2 = data2[flitWidth:0];
	assign flit3 = data3[flitWidth:0];
	assign flit4 = data4[flitWidth:0];

	
	detectInput detector(header1, header2, header3, header4, address, port1_present, port2_present, port3_present, port4_present);

	arbitrer portArbitrer(port1_present, port2_present, port3_present, port4_present, portBlock2, portBlock3, portBlock4, mux_select);

	mux_flit_4x1 mux(flit1, flit2, flit3, flit4, mux_select, outputData);

	initial 
	begin
		address <= ;
	end

endmodule