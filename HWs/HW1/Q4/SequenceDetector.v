//===========================================================
//
//			Sequence Detector
//
//			Implemented by Mehran Mazaheri
//
//          SEQUENCE is parameterized 
//          
//===========================================================
`timescale 1ns/1ns
module SequenceDetector
#(
    parameter SEQUENCE_LENGTH = 11,
    parameter reg [SEQUENCE_LENGTH-1:0]SEQUENCE_PATTERN = SEQUENCE_LENGTH'b01011101000;
)(
    input wire clk,
    input wire in,
    output wire Sequence_detected
)
    reg [SEQUENCE_LENGTH-1:0] sequence = SEQUENCE_LENGTH'b0;
//----------------------------------------------- Sequential Logic
    always @(posedge clk) begin
        sequence <= {in,sequence[SEQUENCE_LENGTH-1:1]};     //Shift Register
    end
//----------------------------------------------- Continuous Assignment
    assign Sequence_detected = SEQUENCE_PATTERN == sequence;
endmodule