clear,clc, close all, syms s Vi Vs C L R R1 R2 R_load 
%Problem 1/2
% x={I_L,Ic,I_Rload,Vo}  <-- unknown vector
A  =[ -1  1  1  0;    % I_L - Ic - I_Rload = 0
     L*s  0  0  1;    % L*s*I_L + Vo = Vi
      0   1  -1  C*s;  % Ic - IR_load + C*sVo= 0
      0  0  -R_load  1]; % -IR_load*Rload + Vo = 0
b  =[ 0; Vi; 0; 0];
x=A\b; Vo_LPF2_damp=simplify(x(4))
for i=1:3 %iterate through zeta
    zeta=[0.1 0.7 1];
omega4=10; F_LPF2_damp=RR_tf([omega4^2],[1 2*zeta(i)*omega4 omega4^2]);
figure(1)
hold on
RR_bode(F_LPF2_damp) %graph bode for zeta(i)
end
%Problem3/4 
syms s V0 C C_d L R R_Rd R1 R2 
% Second-order low-pass LC filter: Solve for Vo as a function of Vi
% x={I_L,I_c,I_Rd,I_Cd,V1,V2}  <-- unknown vector
A  =[ 1  -1  -1  0  0  0;    % I_L - I_c - I_Rd = 0
     0  0  1  -1  0  0;    % I_Rd - I_Cd = 0
      0  0  R_Rd  0  -1  1;  % V1 - V2 - I_Rd*R_Rd = 0
      0  0  0  1  0  C_d*-s; % I_Cd - C_d*s*V2 = 0
      L*s  0  0  0  1  0;   % V1 + L*s*I_L = V0
      0  1  0  0  -C*s 0;]; % I_c - C*s*V1 = 0
b  =[0; 0; 0; 0; V0; 0];
x=A\b; Vo_paraDP_damp=simplify(x(5))

omega5=10; F_paraDP_damp=RR_tf([1 omega5],[(1/1600) 5*(1/1600)*omega5 1 omega5]); %Assuming omega5=10, C*L=1/1600 as omega=10=1/4sqrt(C*L)
RR_bode(F_paraDP_damp) %bode plot for paralleldampfilter
legend({'zeta=0.1','zeta=0.7','zeta=1','||DF'})
xlabel('Frequency')
ylabel('deg')
hold off