module demultiplexerFlit_1x4(select, inputFlitBit, outputFlit1, outputFlit2, outputFlit3, outputFlit4);

	parameter flitWidth = ;

	input wire [1:0] select;
	input wire [flitWidth-1:0] inputFlitBit;
	output wire [flitWidth-1:0] outputFlit1,outputFlit2,outputFlit3,outputFlit4;

	genvar i ;

	generate
		for (i = 0; i < flitWidth; i=i+1) begin
			demultiplexer_1x4 dm(select, inputFlit[i], outputFlit1[i], outputFlit2[i], outputFlit3[i], outputFlit4[i]);
		end
	endgenerate

endmodule