module demultiplexer_1x2(select,inputFlitBit,output_1_FlitBit, output_2_FlitBit);

	input wire inputFlitBit, select;
	output wire output_1_FlitBit,output_2_FlitBit;

	and a1(output_1_FlitBit,inputFlitBit,select);
	and a2(output_2_FlitBit,inputFlitBit,~select);

endmodule