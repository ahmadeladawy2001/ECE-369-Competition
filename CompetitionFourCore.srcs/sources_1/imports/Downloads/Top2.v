`timescale 1ns / 1ps
 //Group 6: Kevin Gilman 33.333%, Ahmad Eladawy 33.333%, Nafisul Khondaker 33.333%
 //5 stage pipeline [Fetch, Decode, Execute, Memory, Writeback]
 //Branch is resolved in the Decode stage


module Top2(Clk, Reset, v0_OUT, v1_OUT, PC_OUT, MIN_OUT, test1, test2, test3);
    input Clk, Reset;
    wire [31:0] v0_A, v1_A, PCValue_A, MIN_A,
                v0_B, v1_B, PCValue_B, MIN_B,
                v0_C, v1_C, PCValue_C, MIN_C,
                v0_D, v1_D, PCValue_D, MIN_D,
                v1_final, v0_final, MIN_final;
                
    output reg [31:0] v0_OUT, v1_OUT, MIN_OUT, PC_OUT, test1, test2, test3;
    
    Top DatapathA(Clk, Reset, v1_A, v0_A, PCValue_A, MIN_A);
    
    TopB DatapathB(Clk, Reset, v1_B, v0_B, PCValue_B, MIN_B);
    
    TopC DatapathC(Clk, Reset, v1_C, v0_C, PCValue_C, MIN_C);
    
    TopD DatapathD(Clk, Reset, v1_D, v0_D, PCValue_D, MIN_D);
    
    THE_BIGGER_SAD The_Bigger_Sad(v1_A, v0_A, MIN_A,
                          v1_B, v0_B, MIN_B,  
                          v1_C, v0_C, MIN_C,  
                          v1_D, v0_D, MIN_D,
                          v1_final, v0_final, MIN_final);
    
    always @(*)
    begin
        v0_OUT <= v0_final;
        v1_OUT <= v1_final;
        MIN_OUT <= MIN_final;
        PC_OUT <= PCValue_D;
        test1 <= PCValue_A;
        test2 <= PCValue_B;
        test3 <= PCValue_C;
    end
    
endmodule
