module router(inFlit1, inFlit2, inFlit3, inFlit4, outputFlit1, outputFlit2, outputFlit3, outputFlit4);

	parameter flitWidth = ;
	parameter routerAddressWidth = ;

	input wire [flitWidth-1:0] inFlit1, inFlit2, inFlit3, inFlit4;
	output wire [flitWidth-1:0] outputFlit1, outputFlit2, outputFlit3, outputFlit4;
	reg [routerAddressWidth-1:0] routerAddress;

	// ---------------------------------------------------------------------------------------------//

	parameter modifiedFlitWidth = ;

	wire [modifiedFlitWidth-1:0] port1to2, port1to3, port1to4, port1to5;
	wire [modifiedFlitWidth-1:0] port2to1, port2to3, port2to4, port2to5;
	wire [modifiedFlitWidth-1:0] port3to1, port3to2, port3to4, port3to5;
	wire [modifiedFlitWidth-1:0] port4to1, port4to2, port4to3, port4to5;
	wire [modifiedFlitWidth-1:0] port5to1, port5to2, port5to3, port5to4;

	wire portBlock1, portBlock2, portBlock3, portBlock4, portBlock5;
	wire portBlock1to2, portBlock1to3, portBlock1to4, portBlock1to5;
	wire portBlock2to1, portBlock2to3, portBlock2to4, portBlock2to5;
	wire portBlock3to1, portBlock3to2, portBlock3to4, portBlock3to5;
	wire portBlock4to1, portBlock4to2, portBlock4to3, portBlock4to5;
	wire portBlock5to1, portBlock5to2, portBlock5to3, portBlock5to4;

	assign portBlock1 = portBlock2to1 | portBlock3to1 | portBlock4to1 | portBlock5to1;
	assign portBlock2 = portBlock1to2 | portBlock3to2 | portBlock4to2 | portBlock5to2;
	assign portBlock3 = portBlock1to3 | portBlock2to3 | portBlock4to3 | portBlock5to3;
	assign portBlock4 = portBlock1to4 | portBlock2to4 | portBlock3to4 | portBlock5to4;
	assign portBlock5 = portBlock1to5 | portBlock2to5 | portBlock3to5 | portBlock4to5;

	//port 1 --> generally used as NORTH port, address => 2'b00
	inputPort in1(inFlit1, routerAddress, portBlock1, port1to2, port1to2, port1to3, port1to4);
	outputPort out1();

	//port 2 --> generally used as EAST port, address => 2'b01
	inputPort in2(inFlit1, routerAddress, portBlock1, port2to1, port2to3, port2to4, port2to5);
	outputPort out2();

	//port 3 --> generally used as SOUTH port, address => 2'b10
	inputPort in3(inFlit3, routerAddress, portBlock1, port1to2, port1to2, port1to3, port1to4);
	outputPort out3();

	//port 4 --> generally used as NORTH port, address => 2'b11
	inputPort in4(inFlit1, routerAddress, portBlock1, port1to2, port1to2, port1to3, port1to4);
	outputPort out4();

	// port 5 used as self injection port, would be redirected accordingly 
	inputPort in5(inFlit1, routerAddress, portBlock1, port1to2, port1to2, port1to3, port1to4);
	outputPort out5();

