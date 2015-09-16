module mux_2x1_bus(input1,input2,select,out);
	
	parameter busWidth=14;

	input wire [busWidth-1:0] input1,input2;
	input wire select; 
	output wire [busWidth-1:0] out;
	
	genvar i ;

	generate
		for (i = 0; i < busWidth; i=i+1) begin
			mux_2x1 m(input1[i],input2[i],select,out[i]);
		end
	endgenerate

endmodule