module buffer(inputFlit, deque, enque, outputFlit);

	parameter buffer_size = ;
	parameter flit_size_modified = ;

	input wire deque,enque;
	input wire [flit_size_modified-1:0] inputFlit,outputFlit;

	reg [buffer_size-1:0] mem;

	// demux of buffer_size (controlled by tail) ==> mux of buffer_size (controlled by head)


	