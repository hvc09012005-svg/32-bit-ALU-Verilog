// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
//----------------------------------------------------
// Project : 32-bit ALU Verification
// Author  : Harsh Vardhan Choubey
// Language: Verilog HDL
// Tool    : EDA Playground
//---------------------------------------------------- 

module tb_alu32;
  // input lines
  reg [31:0] A;
  reg [31:0] B;
  reg [3:0] opcode;
  //output results
  wire signed [31:0] result;
  
  alu32 uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
  );
  
  initial begin
    // Generate VCD waveform for EPWave
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_alu32);
    $display("============================================");
    $display("      32-bit ALU Verification Started");
    $display("============================================");
    // test case 1 : Addition
    // Expected Result : 30
    A = 32'd10;
    B = 32'd20;
    opcode = 4'b0000;
    #10;
    $display("[%0t] ADD : A=%0d B=%0d Result=%0d" , $time, A, B,result);
    // test case 2 : Subtraction 
    // Expected Result : -10
    A = 32'd35;
    B = 32'd45;
    opcode = 4'b0001;
    #10
    $display("[%0t] SUB : A=%0d B=%0d Result=%0d" , $time, A, B,result);
    // test case 3 : AND_operation  
    // Expected Result : 0
    A = 32'd32;
    B = 32'd15;
    opcode = 4'b0010;
    #10
    $display("[%0t] AND : A=%0d B=%0d Result=%0d" , $time, A, B,result);
    // test case 4 : OR_Operation
    // Expected Result : 5
    A = 32'd5;
    B = 32'd4;
    opcode = 4'b0011;
    #10
    $display("[%0t] OR : A=%0d B=%0d Result=%0d" , $time, A, B,result);
    // test case 5 : XOR_Operation
    // Expected Result : 14
    A = 32'd35;
    B = 32'd45;
    opcode = 4'b0100;
    #10
    $display("[%0t] XOR : A=%0d B=%0d Result=%0d" , $time, A, B,result);
    // test case 6 : NOT_Operation
    // Expected Result : -36
    A = 32'd35;
    opcode = 4'b0101;
    #10
    $display("[%0t] NOT : A=%0d  Result=%0d" , $time, A,result);
    // test case 7 : Left Shift
    // Expected Result : 70
    A = 32'd35;
    opcode = 4'b0110;
    #10
    $display("[%0t] SLL : A=%0d Result=%0d" , $time, A,result);
    // test case 8 : Right Shift
    // Expected Result : 17
    A = 32'd35;
    opcode = 4'b0111;
    #10
    $display("[%0t] SRL : A=%0d Result=%0d" , $time, A,result);
    // test case 9 : Comparison
    // Expected Result : 2 (A is Less than B)
    A = 32'd35;
    B = 32'd45;
    opcode = 4'b1000;
    #10
    $display("[%0t] CMP : A=%0d B=%0d Result=%0d" , $time, A, B,result);
     
    $display("============================================");
    $display("  All Test Cases Executed Successfully");
    $display("============================================");
    
    $finish;
  end
  
endmodule