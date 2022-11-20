//===========================================================
//
//			Frequency Multiplier
//
//			Implemented by Mehran Mazaheri
//          
//===========================================================
`timescale 1ns/1ns
module FrequencyMultiplier(
    input wire clk,
    input wire reset,
    input wire [2:0]frequency_select,
    output reg [15:0]sin_signal,
    output reg [15:0]cos_signal
);
//----------------------------------------------- Internal Signals Declaration
    reg [9:0] counter;
    reg [15:0]sinus[0:1023];
    reg [15:0]cosine[0:1023];
//----------------------------------------------- initialize memmory
    initial begin
        $display("Loading memmory.");
        $readmemb("sin.mem", sinus);
        $readmemb("cos.mem", cosine);
    end
//----------------------------------------------- Sequential Logic
    always @(posedge clk) begin
        if (reset) begin
            counter <= 0;
            sin_signal <= sinus[0];
            cos_signal <= cosine[0];
        end else begin
            case (frequency_select)
                3'd1: counter <= counter + 1'b1;
                3'd2: counter <= counter + 2'b10;
                3'd3: counter <= counter + 3'b100;
                3'd4: counter <= counter + 4'b1000;
                3'd5: counter <= counter + 5'b10000;
                default: counter <= counter;
            endcase
            sin_signal <= sinus[counter];
            cos_signal <= cosine[counter];
        end
    end
endmodule