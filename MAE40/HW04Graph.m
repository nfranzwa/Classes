close all, clear, clc
% Define parameters
Vin = 5;  % Input voltage (V)    
Vout = 0  % Initial Output Voltage 
L = 10e-6;      % Inductance (H)
C = 4.7e-6;     % Capacitance (F)
R = 250;        % Load resistance (Ohms)
f = 1.6e6;      % Switching frequency (Hz)
D = 0.6;        % Duty cycle

% Define voltage drop across the diode
Vdiode_drop = 0.7;  % Diode voltage drop (V)

% Calculate constants
sigma = 1 / (2 * R * C);
omega_n = 1 / sqrt(L * C);
zeta = sigma / omega_n;
omega_d = omega_n * sqrt(1 - zeta^2);

% Define time parameters
t_max = 1e-3;   % Maximum simulation time (s)
N = 1000;        % Number of time steps
t = linspace(0, t_max, N+1);

% Initialize arrays for voltage and current
Vout_values = zeros(1, N+1);
IL_values = zeros(1, N+1);

% Simulate buck-boost converter behavior
for i = 1:N+1
    % Calculate duty cycle at time t(i)
    if t(i) < D / f
        D_i = t(i) * f;
    else
        D_i = D;
    end
    
    % Calculate voltage and current at time t(i) including diode drop
    if t(i) < D / f
        Vout_values(i) = Vin - t(i) * R * (Vin / L) - Vdiode_drop;
        IL_values(i) = (Vin - Vout_values(i) - Vdiode_drop) / R; % Add diode drop to IL
    else
        tau = t(i) - D_i / f;
        Vout_values(i) = Vout + (Vin + Vout) * exp(-sigma * tau) * (cos(omega_d * tau) + zeta / sqrt(1 - zeta^2) * sin(omega_d * tau)) - Vdiode_drop;
        IL_values(i) = (Vin - Vout + Vdiode_drop) / R * exp(-sigma * tau) * (cos(omega_d * tau) + zeta / sqrt(1 - zeta^2) * sin(omega_d * tau)); % Add diode drop to IL
    end
end

% Calculate and display average values
Vout_mean = mean(Vout_values);
IL_mean = mean(IL_values);
Imean_approx = (Vout_mean / R) / (1 - D);

% Plot voltage and current over time
figure;
subplot(2, 1, 1);
plot(t, Vout_values);
title('Buck-Boost Converter Output Voltage vs. Time');
xlabel('Time (s)');
ylabel('Vout (V)');
grid on;

subplot(2, 1, 2);
plot(t, IL_values);
title('Buck-Boost Converter Inductor Current vs. Time');
xlabel('Time (s)');
ylabel('IL (A)');
grid on;

% Display average values
disp(['Average Vout: ', num2str(Vout_mean), ' V']);
disp(['Average IL: ', num2str(IL_mean), ' A']);
disp(['Imean_approx: ', num2str(Imean_approx), ' A']);
