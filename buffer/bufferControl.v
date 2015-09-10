module bufferControl(reset, enque, deque, head, tail, bufferFull, bufferEmpty);

	parameter buffer_size = ;
	parameter counter_bits = ;  // log buffer_size

	input wire reset, enque, deque;
	output wire [counter_bits-1:0] head, tail ;

	counter head_counter(deque,reset,head);
	counter tail_counter(enque,reset,tail);

	

endmodule
		
