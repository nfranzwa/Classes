clear,clc, close all, syms s Vi Vs C L R_load Vo R c_1 

% x={I_L,  I_C,   I_R, I_Rload,    Vo,  Vm}  <-- unknown vector
A  =[L*s    0       0       0       0    1  ;   % L*s*I_L + Vm = Vi
      0   1/(C*s)   0       0       1   -1  ;   % I_C/(C*s) + Vo - Vm = 0
      0     0       R       0      -1    0  ;   % I_R*R - Vo = 0
      0     0       0     R/c_1    -1    0  ;   % I_Rload*R_load - Vo = 0 
      1    -1       0       0       0    0  ;   % I_L - I_C = 0
      0    -1       1       1       0    0  ];  % I_R + I_Rload - I_C = 0
   
b  =[Vi; 0; 0; 0; 0; 0];
x=A\b; Vo_notch_huh=simplify(x(5))
latex(Vo_notch_huh);
omega4=10; Q=5; F_notch_huh=RR_tf([(1/Q)*omega4 0],[1 (1/Q)*omega4 omega4^2]);
figure(1)
RR_bode(F_notch_huh)
c1=1;
Q=Q*(1+c1);
F_anti_c1=RR_tf([(1/Q)*omega4 0],[1 (1/Q)*omega4 omega4^2]);
g.linestyle="r-.";
RR_bode(F_anti_c1,g)
title('Bode Plot')
annotation('textbox', [0.02 0.76 0.1 0.1], 'String', 'Magnitude (dB)', 'EdgeColor', 'none');
annotation('textbox', [0.02 0.34 0.1 0.1], 'String', 'Phase (deg)', 'EdgeColor', 'none');
xlabel('Frequency (rad/s)');
