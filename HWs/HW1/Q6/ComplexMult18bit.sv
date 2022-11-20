//===========================================================
//
//			18bits complex multiplier
//
//			Implemented by Mehran Mazaheri
//          
//===========================================================
`timescale 1ns/1ns
module ComplexMult18bit(
    input clk,
    input signed [17:0]ar, ai,
    input signed [17:0]br, bi,
    output signed [36:0] pr, pi
);
    reg signed [17:0] ai_d, ai_dd, ai_ddd, ai_dddd   ;
    reg signed [17:0] ar_d, ar_dd, ar_ddd, ar_dddd   ;
    reg signed [17:0] bi_d, bi_dd, bi_ddd, br_d, br_dd, br_ddd ;
    reg signed [18:0]  addcommon     ;
    reg signed [18:0]  addr, addi     ;
    reg signed [36:0] mult0, multr, multi, pr_int, pi_int  ;
    reg signed [36:0] common, commonr1, commonr2   ;
    always @(posedge clk)begin
        ar_d   <= ar;
        ar_dd  <= ar_d;
        ai_d   <= ai;
        ai_dd  <= ai_d;
        br_d   <= br;
        br_dd  <= br_d;
        br_ddd <= br_dd;
        bi_d   <= bi;
        bi_dd  <= bi_d;
        bi_ddd <= bi_dd;
    end
    always @(posedge clk)begin
        addcommon <= ar_d - ai_d;
        mult0     <= addcommon * bi_dd;
        common    <= mult0;
    end
    always @(posedge clk) begin
        ar_ddd   <= ar_dd;
        ar_dddd  <= ar_ddd;
        addr     <= br_ddd - bi_ddd;
        multr    <= addr * ar_dddd;
        commonr1 <= common;
        pr_int   <= multr + commonr1;
    end
    always @(posedge clk)begin
        ai_ddd   <= ai_dd;
        ai_dddd  <= ai_ddd;
        addi     <= br_ddd + bi_ddd;
        multi    <= addi * ai_dddd;
        commonr2 <= common;
        pi_int   <= multi + commonr2;
    end
    assign pr = pr_int;
    assign pi = pi_int;
endmodule