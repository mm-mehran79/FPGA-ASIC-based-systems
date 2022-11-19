//===========================================================
//
//			FIR Filter with coefs only equal to {-1,0,1}
//
//			Implemented by Mehran Mazaheri
//
//          Flop in - Flop out
//
//          The module is parameterized and could be synthesized with various TAP_NUMBER, INPUT_LENGTH
//          
//===========================================================
`timescale 1ns/1ns
module fir_filter
#(
    parameter TAP_NUMBER = 10,
    parameter INPUT_LENTGH = 8,
)(
    input wire clk,
    input wire signed [INPUT_LENTGH-1:0]In,
    input wire [$clog2(TAP_NUMBER)-1:0]Coef_Num,
    input wire signed [1:0]Coef_Val,
    input wire Coef_w_en,
    output reg signed [$clog2(TAP_NUMBER) + INPUT_LENTGH + 1:0]Out
)
//----------------------------------------------- Reg Declaration
    reg signed [INPUT_LENTGH-1:0]x_n[0:TAP_NUMBER-1];                                           //registered input
    reg signed [1:0]coef[0:TAP_NUMBER-1];                                           //coefficients
    reg signed [INPUT_LENTGH + 1:0]xb[0:TAP_NUMBER-1];                            //multiplied registered input
    reg signed [$clog2(TAP_NUMBER) + INPUT_LENTGH + 1:0]sum[1:TAP_NUMBER-1];      //adders output
//----------------------------------------------- sequential Logic
    always @(posedge clk ) begin
        x_n[0] <= In;                                                                           //flop in
        for (int i=1; i<TAP_NUMBER; ++i)                                                        //registered input
            x_n[i] <= x_n[i-1];
        if (Coef_w_en)                                                                          //change coefficient
            coef[Coef_Num] <= Coef_Val;
        out <= sum[TAP_NUMBER-1];                                                               //flop out
    end
//----------------------------------------------- Combinational Logic
    always @(*) begin
        x_n[0] = In;
        for (int i=0; i<TAP_NUMBER; ++i)                                                        //multipliers replaced with 3->1 MUXs
            xb[i] = coef[i][1]?-x_n[i]:coef[i][0]?x_n[i]:TAP_NUMBER'b0;
        sum[1] = xb[1] + xb[0];                                                                 //first adder implementation
        for (int i=2; i<TAP_NUMBER; ++i)                                                        //Adders implementation
            sum[i] = sum[i-1] + xb[i];
    end
endmodule
