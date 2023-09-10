clear, clc, close all
syms R_L L C s V_IN V_M I_L I_C I_RL V_OUT V_D V_BOUT I_BL V_AOUT I_AL
%% Startup PA
eq1 = V_IN == V_M;
eq2 = V_IN == L*s*I_L;
%S1 = solve(eq1,eq2,I_L,I_C,I_RL,V_M,V_OUT);
%V_OUT_START = S1.V_OUT
%% Phase B
eq3 = V_M == V_OUT - V_D/s;
eq4 = V_M == L*[s*I_L-I_BL];
eq5 = I_C == C*[s*-V_OUT+V_BOUT];
eq6 = V_OUT == -I_RL*R_L;
eq7 = I_L == I_C + I_RL;
A1 = solve(eq3,eq4,eq5,eq6,eq7,I_L,I_C,I_RL,V_M,V_OUT);
V_OUT_PA = A1.V_OUT
%% Phase C
eq8 = V_IN == V_M;
eq9 = V_M == L*s*I_L;
eq10 = V_OUT == -I_RL*R_L;
eq11 = I_C == C*s*V_OUT;
eq12 = I_C == I_RL;
%B1 = solve(eq8,eq9,eq10,eq11,eq12,I_L,I_C,I_RL,V_M,V_OUT);
%V_OUT_PB = B1.V_OUT
%% NEW 1
eq13 = V_IN/s == V_M;
eq14 = V_M == L*[s*I_L-I_AL];
eq15 = I_C == C*[s*V_OUT-V_AOUT];
eq16 = V_OUT == I_RL*R_L;
eq17 = I_C + I_RL == 0;
C1 = solve(eq13,eq14,eq15,eq16,eq17,I_L,I_C,I_RL,V_M,V_OUT,I_BL,V_BOUT);
V_OUT_PC = C1.V_OUT;
%% NEW 3
eq18 = V_M == L*[s*I_L-I_BL];
eq19 = I_C + I_RL == 0;
eq20 = V_OUT == I_RL*R_L;
eq21 = -I_L == I_C + I_RL;
eq22 = I_C == C*[s*V_OUT-V_BOUT];
D1 = solve(eq18,eq19,eq20,eq21,eq22,I_L,I_C,I_RL,V_M,V_OUT,I_BL,V_BOUT);
V_OUT_LC = D1.V_OUT
b_2=V_BOUT
b_1=-I_BL/(C)
b_o=V_D/(C*L)
a_1=1/(C*R_L)
a_o=1/(C*L)
o=1/(2*C*R_L)
w_d=sqrt((a_o-(a_1^2)/4))
B_2=b_o/(o^2+w_d^2)
B_1=b_2-B_2
B_o=(b_1*b_2*o)/(w_d)
E=B_2/s+B_1*(s+o)/(((s+o)^2)+w_d^2)+B_o*(w_d)/(((s+o)^2)+w_d^2);
V_OO=ilaplace(E)
t_A=0;t_B=6e-7;
tval= linspace(t_A,t_B,100);
subvars=[V_IN,V_D,L,C,R_L,V_BOUT,I_BL]
subvarsic = [5 0.5 10e-6 4.7e-6 250 0 0]
V_OO=subs()