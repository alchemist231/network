module comparator(input1, input2, equal, less, greater);

	parameter input_size = ;

	input wire [input_size-1:0] input1, input2;
	output equal, greater, less;

	reg equal,greater,less;

	always@(input1, input2)
	begin
		if(input1<input2)
			begin
				equal   = 0;
				greater = 0;
				less    = 1;
			end
		else if(input1==input2)
			begin
				equal   = 1;
				greater = 0;
				less    = 0;
			end
		else
			begin
				equal   = 0;
				greater = 1;
				less    = 0;
			end
	end

endmodule

