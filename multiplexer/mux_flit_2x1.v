module mux_flit_2x1(flit1,flit2,select,outFlit);
	
	parameter flit_width=6;

	input wire [flit_width-1:0] flit1,flit2;
	input wire select; 
	output wire [flit_width-1:0] outFlit;
	
	genvar i ;

	generate
		for (i = 0; i < flit_width; i=i+1) begin
			mux_4x1 m(flit1[i],flit2[i],select,outFlit[i]);
		end
	endgenerate

endmodule