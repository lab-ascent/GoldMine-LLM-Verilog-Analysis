// Design a 5-bit maximal-length Galois LFSR with taps at bit positions 5 and 3
module lfsr( 
    input clk,
    input reset,
    output [4:0] q
); 
reg [4:0] r_reg;
wire [4:0] r_next;
wire feedback_value;
// on reset set the value of r_reg to 1
// otherwise assign r_next to r_reg
// assign the xor of bit positions 2 and 4 of r_reg to feedback_value
// assign feedback concatenated with 4 most significant bits of r_reg to r_next
// assign r_reg to the output q
assign r_next = ((r_reg[2] ^ r_reg[4]) ? 
feedback_value : r_reg[4]);
assign q = r_reg;
//initial state
always @(posedge clk or posedge reset)
if (reset)
r_reg <= 5'd1;
//tap values. The values of j,j-1, j-2, and j-3 are used as a parameter for
//the xor gates that generate the feedback value.
//j-3 has no tap value because it is generated by previous tap values.
else
 begin 
//generate feedback value 
r_reg <= r_next; 
end 
endmodule
