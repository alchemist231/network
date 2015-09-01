module mux_4x1(in1,in2,in3,in4,s1,s0,out1);

	input in1,in2,in3,in4,s1,s0;
	output out1;

	wire in1,in2,in3,in4,s1,s0,out1,m1_out,m2_out;

	mux_2x1 m1(in1,in2,s0,m1_out);
	mux_2x1 m2(in3,in4,s0,m2_out);

	mux_2x1 mfinal(m1_out,m2_out,s1,out1);
  
endmodule
