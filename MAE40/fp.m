clear, clc, close all
syms R_L L C s V_IN V_M I_L I_C I_RL V_OUT V_D V_BOUT I_BL V_AOUT I_AL t
%% Startup PA
eq1 = V_IN == V_M;
eq2 = V_IN == L*s*I_L;
%S1 = solve(eq1,eq2,I_L,I_C,I_RL,V_M,V_OUT);
%V_OUT_START = S1.V_OUT
%% Phase B
eq3 = V_M == V_OUT - V_D/s;
eq4 = V_M/s == L*[s*I_L-I_BL];
eq5 = I_C == C*[s*V_OUT-V_BOUT];
eq6 = V_OUT == I_RL*R_L;
eq7 = I_L == -I_C - I_RL;
A1 = solve(eq3,eq4,eq5,eq6,eq7,I_L,I_C,I_RL,V_M,V_OUT);
V_OUT_PA = A1.V_OUT
bruh=ilaplace(V_OUT_PA)
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
b_2=V_BOUT;
b_1=-I_BL/(C);
b_o=V_D/(C*L);
a_1=1/(C*R_L);
a_o=1/(C*L);
o=1/(2*C*R_L);
w_d=sqrt((a_o-(a_1^2)/4));
B_2=b_o/(o^2+w_d^2);
B_1=b_2-B_2;
B_o=(b_1-b_2*o)/(w_d)-B_2*o/w_d;
E=B_2/s+B_1*(s+o)/(((s+o)^2)+w_d^2)+B_o*(w_d)/(((s+o)^2)+w_d^2);
V_OO=ilaplace(E);




V_IN=5, V_D=0.5, L=10*10^-6, C=4.7*10^-6, R_L=250 
V_BOT= B_2+(B_1*cos(w_d*t)*exp(-o*t))+(B_o*sin(w_d*t)*exp(-o*t))


% Calculate V_BOT for each time value
V_BOT = B_2 + (B_1 * cos(w_d * t) .* exp(-o * t)) + (B_o * sin(w_d * t) .* exp(-o * t));
%%V_D - exp(-t/(2*C*R_L))*sin(t*(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2))*((I_BL/C + V_BOUT/(2*C*R_L))/(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2) + V_D/(2*C*R_L*(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2))) + cos(t*(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2))*exp(-t/(2*C*R_L))*(V_BOUT - V_D)


%%
q1= V_M-V_OUT==V_D/s
q2= V_OUT==R_L*I_RL;
q3= I_C==C*[s*V_OUT-V_BOUT];
q4= V_IN/s-V_M==L*[s*I_L-I_BL];
q5= I_L==I_C+I_RL;
sol =solve(q1,q2,q3,q4,q5,I_L,I_C,I_RL,V_M,V_OUT,I_BL,V_BOUT)
boost=sol.V_OUT