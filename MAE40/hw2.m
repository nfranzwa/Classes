clear,clc, close all, syms s Vi Vs C L R_a C_b R_d C_c Vo C_a C_d R_b R_c

% x={I_a,   I_b,     I_c,     I_d,  I_o,  V1,  V2}  <-- unknown vector
A  =[ R_a    0        0        0     0    1     0;   % I_a*R_a + V1 = Vo
      0   1/(C_b*s)   0        0     0    0     1;   % I_b/(C_b*s) + V2 = Vo
      0      0        0       R_d    0    0    -1;   % I_d*R_d - V2 = 0
      0      0     1/(C_c*s)   0     0   -1     1;   % I_c/(C_c*s) - V1 + V2 = 0
      0      1        1       -1     0    0     0;   % I_b + I_c - I_d = 0
      1      0        -1       0     0    0     0;   % I_a - I_c = 0
      0      0        0       -1     1    0     0];  % I_o - I_d = 0
b  =[Vo; Vo; 0; 0; 0; 0; 0];
x=A\b; Vo_notch_huh=simplify(x(6))
latex(Vo_notch_huh);
omega4=10; F_notch_huh=RR_tf([1 omega4 omega4^2],[1 3*omega4 omega4^2]);
figure(1)
RR_bode(F_notch_huh)  
title('Bode Plot')
annotation('textbox', [0.02 0.76 0.1 0.1], 'String', 'Magnitude (dB)', 'EdgeColor', 'none');
annotation('textbox', [0.02 0.34 0.1 0.1], 'String', 'Phase (deg)', 'EdgeColor', 'none');
xlabel('Frequency (rad/s)');
% y={I_a,        I_b,   I_c,    I_d,     I_o, V1,   V2}  <-- unknown vector
 C =[ 0           1      1      -1        0    0     0;   % I_b + I_c - I_d = 0
      1           0     -1       0        0    0     0;   % I_a - I_c = 0
      0           0      0      -1        1    0     0;   % I_o - I_d = 0
      1/(C_a*s)   0      0       0        0    1     0;   % I_a/(C_a*s) + V1 = Vo
      0          R_b     0       0        0    0     1;   % I_b*R_b + V2 = Vo
      0           0     R_c      0        0   -1     1;   % I_c*R_c + V2 - V1 = 0
      0           0      0    1/(C_d*s)   0    0    -1];  % I_d/(C_d*s) - V2 = 0
d = [0;0;0;Vo;Vo;0;0];
y=C\d; Vo_cir=simplify(y(6))
latex(Vo_cir);
omega5=10; F_cir=RR_tf([1 omega5 omega5^2],[1 3*omega5 omega5^2]);
figure(2)
RR_bode(F_cir)
title('Bode Plot')
annotation('textbox', [0.02 0.76 0.1 0.1], 'String', 'Magnitude (dB)', 'EdgeColor', 'none');
annotation('textbox', [0.02 0.34 0.1 0.1], 'String', 'Phase (deg)', 'EdgeColor', 'none');
xlabel('Frequency (rad/s)');
