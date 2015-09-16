module singleRouteTest();

	parameter flitWidth = 12;
	parameter routerAddressWidth = 4;
	parameter portAddressWidth = 2;
	parameter modifiedFlitWidth=14;

	reg [flitWidth-1:0] inFlit;
	reg [modifiedFlitWidth-1:0] data2,data3,data4;
	reg [routerAddressWidth-1:0] routerAddress;
	reg [portAddressWidth-1:0] portAddress;
	reg portBlock;

	wire [flitWidth-1:0] outputData;
	wire [modifiedFlitWidth-1:0] outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4;
	wire portBlock1, portBlock2, portBlock3, portBlock4;

	inputPort in1(inFlit, routerAddress, portBlock, outFlitPort1, outFlitPort2, outFlitPort3, outFlitPort4);
	outputPort o1(outFlitPort1, data2, data3, data4, portBlock1, portBlock2, portBlock3, portBlock4, outputData);

	initial
	begin
		routerAddress=4'b0110;
		portBlock = 0;

		inFlit=12'b100100101011;
		data2 =14'b00000000000000;
		data3 =14'b01100000011110;
		data4 =14'b01000011110000;

		
		#10 inFlit=12'b000000000000;


		
		#10 inFlit=12'b011100100001;

		
		#10 data2 =14'b01000110001010;
		//#10 data2 =14'b01011000011010;


		
		#10 data3 =14'b00000000000000;
		data2 =14'b00000000000000;
	end

endmodule
