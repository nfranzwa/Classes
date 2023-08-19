clear, close all, syms s V0 C C_d L R R_Rd R1 R2 
% Second-order low-pass LC filter: Solve for Vo as a function of Vi
% x={I_L,I_c,I_Rd,I_Cd,V1,V2}  <-- unknown vector
A  =[ 1  -1  -1  0  0  0;    % I_L - Ic - I_Rload = 0
     0  0  1  -1  0  0;    % L*s*I_L + Vo = Vi
      0  0  R_Rd  0  -1  1;  % Ic - IR_load + C*sVo= 0
      0  0  0  1  0  -C_d*s; % -IR_load*Rload + Vo = 0
      L*s  0  0  0  1  0;
      0  1  0  0  -C*s 0;]
b  =[0; 0; 0; 0; V0; 0];
x=A\b; Vo_LPF2_damp=simplify(x(5))

omega5=10; F_LPF2_damp=RR_tf([1 omega5],[(1/1600) 5*(1/1600)*omega5 1 omega5]);
%F_LPF2_damp=RR_tf([1 omega5],[C*L 5*C*L*omega5 1 omega5]);
figure(1)
RR_bode(F_LPF2_damp)

