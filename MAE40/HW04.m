clear, clc, close all
syms R L C s V_IN V_M I_L I_C I_R V_OUT V_D V_BOUT I_BL V_AOUT I_AL t 
%% Phase A, diode
eq3 = V_M == V_OUT - V_D/s;
eq4 = V_M == L*[s*I_L-I_AL];
eq5 = I_C == C*[s*V_OUT-V_AOUT];
eq6 = V_OUT == I_R*R;
eq7 = I_L == -I_C - I_R;
A1 = solve(eq3,eq4,eq5,eq6,eq7,I_L,I_C,I_R,V_M,V_OUT);
V_OUT_AD = A1.V_OUT
AD=ilaplace(V_OUT_AD)
%% Phase A, w/o diode
eq8 = -I_L == I_C+I_R;
eq9 = V_M == L*[s*I_L-I_AL];
eq10 = V_OUT == I_R*R;
eq11 = I_C == C*[s*V_OUT-V_AOUT];
eq12 = I_C + I_R == 0;
B1 = solve(eq8,eq9,eq10,eq11,eq12,I_L,I_C,I_R,V_M,V_OUT);
V_OUT_AND = B1.V_OUT
AND=ilaplace(V_OUT_AND)
%% Phase B, diode
eq13 = V_M == V_OUT - V_D/s;
eq14 = V_M == L*[s*I_L-I_AL];
eq15 = I_C == C*[s*V_OUT-V_AOUT];
eq16 = V_OUT == I_R*R;
eq17 = I_L == -I_C - I_R;
C1 = solve(eq3,eq4,eq5,eq6,eq7,I_L,I_C,I_R,V_M,V_OUT);
V_OUT_BD = C1.V_OUT
BD=ilaplace(V_OUT_BD)
%% Phase B, w/o diode
eq18 = -I_L == I_C+I_R;
eq19 = V_M == L*[s*I_L-I_BL];
eq20 = V_OUT == I_R*R;
eq21 = I_C == C*[s*V_OUT-V_BOUT];
eq22 = I_C + I_R == 0;
D1 = solve(eq8,eq9,eq10,eq11,eq12,I_L,I_C,I_R,V_M,V_OUT);
V_OUT_BND = D1.V_OUT
BND=ilaplace(V_OUT_BND)
%% e
c_2=I_BL;
c_1=I_BL/(C*R)+V_BOUT/L+V_D/L;
c_o=V_D/(C*R*L);
b_2=V_BOUT;
b_1=-I_BL/(C);
b_o=V_D/(C*L);
a_1=1/(C*R);
a_o=1/(C*L);
o=1/(2*C*R);
w_d=sqrt((a_o-(a_1^2)/4));
B_2=b_o/(o^2+w_d^2);
B_1=b_2-B_2;
B_o=(b_1-b_2*o)/(w_d)-B_2*o/w_d;
C_2=c_o/(o^2+w_d^2);
C_1=c_2-C_2;
C_o=(c_1-c_2*o)/(w_d)-C_2*o/w_d;
V_IN=5; V_D=0.5; L=10*10^-6; C=4.7*10^-6; R=250 ; f=1.6e6; D=0.600016;

%% plot xd
%t_A = 0; t_B = 6e-3;
%tval = linspace(t_A,t_B,200);

%subvars =   [V_IN,V_D ,L  ,C,    R  ,V_OUT_AD,I_AL];
%subvarsic = [5  ,.5  ,10e-6, 4.7e-6, 250, 0 0];
%V_OUT = subs(V_OUT,subvars,subvarsic);
%v2 = subs(V_OUT,t,tval);
%VO_sus=B_2 + B_1*exp(-o*(t-t_A))*cos(o*(t-t_A))+B_o*exp(-o*(t-t_A))*sin(o*(t-t_A));
%sussy = subs(VO_sus,subvars,subvarsic);
% Constants
V_IN = 5;
V_D = 0.5;
L = 10e-6;
C = 4.7e-6;
R = 250;
I_AL = 0;
V_AOUT = 0;

% Define a range of 't' values from 0 to 6e-7
t = linspace(0, 6e-7, 1000); % Adjust the number of points (1000 in this case) as needed

% Initialize AD vector
%AD = zeros(size(t));

% Calculate AD as a function of t
%for i 1:1000

    
% Plot the graph
%plot(t, AD);
%xlabel('t');
%ylabel('AD');
%title('Graph of AD');
%grid on;
%t_b-t_a=D/F, t_c-t_b=(1-D1)/f
%% P,A
%V_o_oa=V_AOUT*exp(-(t-t_a)/(R*C))
%I_o_oa=V_IN(t-t_a)/L+I_AL
%% P,B
%V_o_ob=B_2/s+B_1*(s+o)/(((s+o)^2)+w_d^2)+B_o*(w_d)/(((s+o)^2)+w_d^2);
%I_o_ob=C_2/s+C_1*(s+o)/(((s+o)^2)+w_d^2)+C_o*(w_d)/(((s+o)^2)+w_d^2);
%V_OO=ilaplace(V_o_ob);
%t=linspace(0,6e-7,100);
%for i 1:100
%    J=t(i)
%   Q=V_OO(J)
 %  hold on
 %  plot(J,Q)
%end
%hold off

%V_AOT = B_2 + (B_1 * cos(w_d * t) .* exp(-o * t)) + (B_o * sin(w_d * t) .* exp(-o * t));






% Calculate V_BOT for each time value
%V_BOT = B_2 + ((B_1 * cos(w_d * (t-t_b) .* exp(-o * (t-t_b))))) + (B_o * sin(w_d * (t-t_b)) .* exp(-o * (t-t_b)b));
%%V_D - exp(-t/(2*C*R_L))*sin(t*(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2))*((I_BL/C + V_BOUT/(2*C*R_L))/(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2) + V_D/(2*C*R_L*(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2))) + cos(t*(1/(C*L) - 1/(4*C^2*R_L^2))^(1/2))*exp(-t/(2*C*R_L))*(V_BOUT - V_D)
