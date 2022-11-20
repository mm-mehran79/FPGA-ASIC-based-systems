//===========================================================
//
//			Frequency Multiplier Testbrnch
//
//			Implemented by Mehran Mazaheri
//          
//===========================================================
`timescale 1ns/1ns
module FrequencyMultiplier_TB;
    reg clk = 1;
    always #5 clk = ~clk;
    reg reset;
    reg [2:0]frequency_select = 3'd2;
    integer sin_file, cos_file;
    initial begin
        sin_file = $fopen("sin.txt", "w");
        cos_file = $fopen("cos.txt", "w");
        reset = 1;
        #2
        reset = 0;
        for (int i=0; i<1024; ++i) begin
            @(posedge clk);
            #1
            $fwrite(sin_file, "%x\n", uut.sin_signal);
            $fwrite(cos_file, "%x\n", uut.cos_signal);
        end
        $fclose(sin_file);
        $fclose(cos_file);
        $display("Testbench done successfully.\n");
        $stop;
    end
    FrequencyMultiplier uut(.clk(clk), .reset(reset), .frequency_select(frequency_select), .sin_signal(), .cos_signal());
endmodule
