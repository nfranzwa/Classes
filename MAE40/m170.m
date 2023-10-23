close all, clear, clc
syms R_1 R_2 V_1 V_2 V_3 V_in 
A = [1      -1     -1 ;
    R_1      0      0 ; 
     0      R_1     0 ;
     0       0     R_2 ];
b = [0;  V_in-V_1;  V_2;  V_3]
x=A\b