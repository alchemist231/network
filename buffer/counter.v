module counter (strobe, reset, out);

	parameter counter_size = ;

	input wire strobe, reset ;
	output [counter_size-1:0] out;

	reg [counter_size-1:0] out;

	always@posedge strobe
	begin
		if (reset)
			begin
				out <= 0 ; //counter_size'b0000.....
			end
		else
			begin
				out <= out + 1 ;
				if ( out == counter_size'b11111.....)
				begin
					out <= 0 ;
				end	
			end

	end

endmodule