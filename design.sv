// Code your design here
// Code your design here
module alu32(
  // 32 bit input lines 
  input [31:0] A,
  input [31:0] B,
  // 4 bit opcode
  input [3:0] opcode,
  // 32 bit result registor 
  output reg [31:0] result) ;
  //opcode for different operations
  parameter ADD = 4'b0000;
  parameter SUB = 4'b0001;
  parameter AND_OP = 4'b0010;
  parameter OR_OP = 4'b0011;
  parameter XOR_OP = 4'b0100;
  parameter NOT_OP = 4'b0101;
  parameter SLL = 4'b0110;
  parameter SRL = 4'b0111;
  parameter CMP = 4'b1000;
  
  always @(*) begin
    case(opcode)
      
       ADD       : result = A + B ;
       SUB       : result = A - B ;
       AND_OP    : result = A & B ;
       OR_OP     : result = A | B ;
       XOR_OP    : result = A ^ B ;
       NOT_OP    : result = ~A ;
       SLL       : result = A << 1 ;
       SRL       : result = A >> 1 ;
       CMP       : result = (A == B)? 32'd0: (A > B)? 32'd1 : 32'd2 ;
      
    endcase
    
  end
  
  
endmodule
      
      