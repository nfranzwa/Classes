clear, close all, syms s Vi Vs C L R R1 R2 R_load 
% Second-order low-pass LC filter: Solve for Vo as a function of Vi
% x={I_L,Ic,I_Rload,Vo}  <-- unknown vector
A  =[ -1  1  1  0;    % I_L - Ic = 0
     L*s  0  0  1;    % L*s*I_L + Vo = Vi
      0   1  -1  C*s;  % C*s*Vo - Ic = 0
      0  0  -R_load  1] % IR_load*R_load = Vo
b  =[ 0; Vi; 0; 0];
x=A\b; Vo_LPF2_damp=simplify(x(4))
omega4=10; F_LPF2_damp=RR_tf([omega4^2],[1 2*z*omega4 omega4^2]);
figure(1), RR_bode(F_LPF2_damp)
