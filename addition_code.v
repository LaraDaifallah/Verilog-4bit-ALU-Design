module addition_code(input [3:0]a, b, input cin, output cout ,output [3:0] res ) ;
wire [2:0]C;
full_adder (a[0],b[0],cin, C[0],res[0]);
full_adder (a[1],b[1],C[0],C[1],res[1]);
full_adder (a[2],b[2],C[1],C[2],res[2]);
full_adder (a[3],b[3],C[2],cout,res[3]);
endmodule 