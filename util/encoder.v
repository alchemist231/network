module encoder(input1, input2, input3 , input4, out);

	input wire input1, input2, input3, input4;
	output wire [1:0] out;

	always@(input1,input2,input3,input4)
	begin
		if(input1)
			begin
				out <= 2'b00;
			end
		else if (input2)
			begin
				out <= 2'b01;
			end
		else if (input3)
			begin
				out <= 2'b10;
			end
		else 
			begin
				out <= 2'b11;
			end
	end

endmodule