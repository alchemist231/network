module outPortTest();

	parameter dataWidth = 14;

	reg [dataWidth-1:0] data1,data2,data3,data4;
	wire [dataWidth-3:0] outputData;
	wire portBlock1, portBlock2, portBlock3, portBlock4;

	outputPort o1(data1, data2, data3, data4, portBlock1, portBlock2, portBlock3, portBlock4, outputData);

	initial
	begin
		data1=14'b10011000101000;
		data2=14'b10111010010110;
		data3=14'b00000000000000;
		data4=14'b10100010000001;

	end

endmodule


