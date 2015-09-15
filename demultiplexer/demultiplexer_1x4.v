module demultiplexer_1x4(select, inputFlitBit, output_1_FlitBit, output_2_FlitBit, output_3_FlitBit, output_4_FlitBit);

	input wire inputFlitBit;
	input wire [1:0] select;
	output wire output_1_FlitBit,output_2_FlitBit,output_3_FlitBit,output_4_FlitBit;

	wire output1,output2,output3,output4;

	demultiplexer_1x2 d1(select[0],inputFlitBit,output1,output2);
	demultiplexer_1x2 d2(select[0],inputFlitBit,output3,output4);

	and a1(output_1_FlitBit,~select[1],output1);
	and a2(output_2_FlitBit,~select[1],output2);
	and a3(output_3_FlitBit,select[1],output3);
	and a4(output_4_FlitBit,select[1],output4);

endmodule


