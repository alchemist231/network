module mux_flit_4x1(flit1,flit2,flit3,flit4,select,outFlit);
	// flit width => size of output bus
	parameter flit_width=6;

	input wire [flit_width-1:0] flit1,flit2,flit3,flit4;
	input wire [1:0] select; 
	output wire [flit_width-1:0] outFlit;
	
	genvar i ;

	generate
		for (i = 0; i < flit_width; i=i+1) begin
			mux_4x1 m(flit1[i],flit2[i],flit3[i],flit4[i],select[1],select[0],outFlit[i]);
		end
	endgenerate

endmodule