//===========================================================
//
//			Debouncer
//
//			Implemented by Mehran Mazaheri
//
//          COUNTER_LENGTH is parameterized 
//          
//===========================================================
`timescale 1ns/1ns
module Debouncer
#(
    parameter COUNTER_LENGTH = 10
)(
    input wire clk,
    input wire reset,
    input wire pb_input,
    output wire pb_output
)
//----------------------------------------------- Internal Signals Declaration
    reg [COUNTER_LENGTH-1:0] counter;
    wire pb_change_signal;
//----------------------------------------------- Sequential Logic
    always @(posedge clk) begin
        if (reset) begin
            counter <= 0;
            pb_output <= pb_input;
        end else begin
            pb_output <= &counter ^ pb_output;
            if(pb_change_signal)
                counter <= counter + 1;
            else
                counter <= 0;
        end
    end
//----------------------------------------------- Continuous Assignment
    assign pb_change_signal = pb_output^pb_input;
endmodule