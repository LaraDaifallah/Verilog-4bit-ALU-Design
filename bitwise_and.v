module bitwise_and(input [3:0] a,b,output [3:0]and_res);
and and1(and_res[0],a[0],b[0]);
and and2(and_res[1],a[1],b[1]);
and and3(and_res[2],a[2],b[2]);
and and4(and_res[3],a[3],b[3]);
endmodule 