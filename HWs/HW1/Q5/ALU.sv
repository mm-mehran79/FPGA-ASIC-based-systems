//===========================================================
//
//			ALU {Addition 00, Subtract 01, Multiply 10, division 11}
//
//			Implemented by Mehran Mazaheri
//          
//===========================================================
`timescale 1ns/1ns
module ALU
(
    input wire [3:0]A,
    input wire [3:0]B,
    input wire [1:0]sel,
    output wire [7:0] alu_out
)
//----------------------------------------------- Reg Declaration
    reg [0:7]internal_signal[0:6];
//----------------------------------------------- Combinational Logic
    always @(*) begin
        case (sel)
            00: alu_out = A + B;
            01: alu_out = A - B;
            10: alu_out = A * B;
            11:begin
                alu_out[7] = A >= {B,3'b000};
                internal_signal[0] = alu_out[7]?{A,4'h0}-{B,3'h0}:{A,4'h0};
                alu_out[6] = internal_signal[0] >= {B,2'b00};
                internal_signal[1] = alu_out[6]?internal_signal[0]-{B,2'b0}:internal_signal[0];
                alu_out[5] = internal_signal[1] >= {B,1'b0};
                internal_signal[2] = alu_out[5]?internal_signal[1]-{B,1'b0}:internal_signal[1];
                alu_out[4] = internal_signal[2] >= B;
                internal_signal[3] = alu_out[4]?internal_signal[2]-B:internal_signal[2];
                alu_out[3] = (internal_signal[3]<<1) >= B;
                internal_signal[4] = alu_out[3]?(internal_signal[3]<<1)-B:(internal_signal[3]<<1);
                alu_out[2] = (internal_signal[4]<<1) >= B;
                internal_signal[5] = alu_out[2]?(internal_signal[4]<<1)-B:(internal_signal[4]<<1);
                alu_out[1] = (internal_signal[5]<<1) >= B;
                internal_signal[6] = alu_out[1]?(internal_signal[5]<<1)-B:(internal_signal[5]<<1);
                alu_out[0] = (internal_signal[6]<<1) >= B;
                internal_signal[6] = alu_out[1]?(internal_signal[6]<<1)-B:(internal_signal[6]<<1);
            end
            default: alu_out = 0;
        endcase
    end
endmodule
