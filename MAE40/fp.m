clear, clc, close all
syms R_L L C s V_IN V_M I_L I_C I_RL V_OUT V_D V_BOUT I_BL 
%% Startup PA
eq1 = V_IN == V_M;
eq2 = V_IN == L*s*I_L;
S1 = solve(eq1,eq2,I_L,I_C,I_RL,V_M,V_OUT);
V_OUT_START = S1.V_OUT
%% Phase B
eq3 = V_M == V_OUT - V_D/s;
eq4 = V_M == L*s*I_L;
eq5 = I_C == C*s*-V_OUT;
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
B1 = solve(eq8,eq9,eq10,eq11,eq12,I_L,I_C,I_RL,V_M,V_OUT);
V_OUT_PB = B1.V_OUT
%% NEW
%eq13 = V_M-V_OUT == V_D/s;
%eq14 = V_OUT == R_L*I_RL;
%eq15 = I_C == C*[s*V_OUT-V_BOUT];
%eq16 = V_IN/s-V_M == L*[s*I_L-I_BL];
%eq17 = I_L == I_C + I_RL;
%C1 = solve(eq13,eq14,eq15,eq16,eq17,I_L,I_C,I_RL,V_M,V_OUT,I_BL,V_BOUT);
%V_OUT_PC = C1.V_OUT