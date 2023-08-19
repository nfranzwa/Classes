clear,clc, close all, syms s Vi Vs C L R_a C_b R_d C_c Vo

% x={I_a,   I_b,     I_c,     I_d,  I_o,  V1,  V2}  <-- unknown vector
A  =[ R_a    0        0        0     0    1     0;   % I_a*R_a + V1 = Vo
      0   1/(C_b*s)   0        0     0    0     1;   % I_b/(C_b*s) + V2 = Vo
      0      0        0       R_d    0    0    -1;   % I_d*R_d - V2 = 0
      0      0     1/(C_c*s)   0     0   -1     1;   % I_c/(C_c*s) - V1 + V2 = 0
      0      1        1       -1     0    0     0;   % I_b + I_c - I_d = 0
      1      0        -1       0     0    0     0;   % I_a - I_c = 0
      0      0        0       -1     1    0     0];  % I_o - I_d = 0
b  =[Vo; Vo; 0; 0; 0; 0; 0];
x=A\b; Vo_LPF2_damp=simplify(x(6));
latex(Vo_LPF2_damp)