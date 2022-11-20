//===========================================================
//
//			Shift Register
//
//			Implemented by Mehran Mazaheri
//
//          OUTPUT_LENGTH is parameterized 
//          
//===========================================================
`timescale 1ns/1ns
module ShiftRegister
#(
    parameter OUTPUT_LENGTH = 10
)(
    input wire clk,
    input wire serial_in,
    input wire [1:0]control_signal,
    output wire [OUTPUT_LENGTH-1:0] parallel_out
)
//----------------------------------------------- Combinational Logic
    always @(*) begin
        case (control_signal)
            2'b00: parallel_out <= parallel_out;                                        //latch
            2'b01: parallel_out <= {parallel_out[COUNTER_LENGTH-2:0],serial_in};        //shift left
            2'b10: parallel_out <= {serial_in, parallel_out[COUNTER_LENGTH-1:1]};       //shift right
            2'b11: parallel_out <= {COUNTER_LENGTH{serial_in}};                         //load
            default: 
                parallel_out <= parallel_out;
        endcase
    end
endmodule