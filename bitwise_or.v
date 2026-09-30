module bitwise_or(input [3:0] a,b,output [3:0]or_res);
or or1(or_res[0],a[0],b[0]);
or or2(or_res[1],a[1],b[1]);
or or3(or_res[2],a[2],b[2]);
or or4(or_res[3],a[3],b[3]);
endmodule 
