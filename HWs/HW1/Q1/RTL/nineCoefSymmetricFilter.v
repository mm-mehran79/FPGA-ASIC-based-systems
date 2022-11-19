//===========================================================
//
//			Symmetric FIR Filter with 9 Coefficients
//
//			Implemented by Mehran Mazaheri
//
//          Flop in - Flop out
//
//          The module is parameterized and could be synthesized with various COEF_NUMBER, INPUT_LENGTH, COEF_LENGTH
//          
//===========================================================
`timescale 1ns/1ns
module symmetric_fir_filter
#(
    parameter COEF_NUMBER = 9,
    parameter INPUT_LENTGH = 8,
    parameter COEF_LENTGH = 8
)(
    input wire clk,
    input wire signed [INPUT_LENTGH-1:0]In,
    input wire [$clog2(COEF_NUMBER)-1:0]Coef_Num,
    input wire signed [COEF_LENTGH-1:0]Coef_Val,
    input wire Coef_w_en,
    output reg signed [$clog2(COEF_NUMBER) + INPUT_LENTGH + COEF_LENTGH:0]Out
)
//----------------------------------------------- Reg Declaration
    reg signed [INPUT_LENTGH-1:0]x_n[0:2*COEF_NUMBER-2];                                        //registered input
    reg signed [COEF_LENTGH-1:0]coef[0:COEF_NUMBER-1];                                          //coefficients
    reg signed [INPUT_LENTGH + COEF_LENTGH - 1:0]xb[0:COEF_NUMBER-1];                           //multiplied registered input
    reg signed [$clog2(COEF_NUMBER) + INPUT_LENTGH + COEF_LENTGH - 1:0]sum[1:COEF_NUMBER-1];    //adders output
//----------------------------------------------- sequential Logic
    always @(posedge clk ) begin
        x_n[0] <= In;                                                                           //flop in
        for (int i=1; i<COEF_NUMBER; ++i)                                                       //registered input
            x_n[i] <= x_n[i-1];
        if (Coef_w_en)                                                                          //change coefficient
            coef[Coef_Num] <= Coef_Val;
        out <= sum[COEF_NUMBER-1];                                                              //flop out
    end
//----------------------------------------------- Combinational Logic
    always @(*) begin
        for (int i=0; i < COEF_NUMBER-1; ++i)                                                   //multipliers implementation
            xb[i] = coef[i] * (x_n[i] + x_n[2*COEF_NUMBER-i]);                                  //these multipliers implemented more efficient due to symmetric coefficients
        xb[COEF_NUMBER-1] = coef[COEF_NUMBER-1] * x_n[COEF_NUMBER-1];                           //last multiplier implementation
        sum[1] = xb[1] + xb[0];                                                                 //first adder implementation
        for (int i=2; i<COEF_NUMBER; ++i)                                                       //Adders implementation
            sum[i] = sum[i-1] + xb[i];
    end
endmodule
