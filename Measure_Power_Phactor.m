#! /usr/bin/octave -qf --persist
# AC Circuit Analysis
#
# run this file with:  ./Template.m
# or: octave --persist Template.m
#
# Requires:
# octave-signal that requieres octave-control

clear all
#close all
# Generating Simulated Signal for Testing
f = 50;             # Frequency in Herts
T = 1 / f;          # Period in seconds
w = 2 * pi * f;     # Frequency in rad/s

Veff = 230;           # Voltage Source
Vp = sqrt(2) * Veff;  # Peak Voltage

nT = 2;             # Number of Periods to show
sT = 36;            # Samples per Period

#t = 0:T/sT:nT*T;     # Array of time
t = linspace(0, nT*T, sT*nT);
Vs = Vp * sin(w * t);
# Simulated Current fir testing
Ip = Vp / 10;
phi_deg = -40;   # Capacitive Load.
                # > 0, Current advanced over Voltage
                # Inductive Load, AC Motor.
                # < 0, Current delayed over Voltage
phi_rad = phi_deg / 360 * 2 * pi;
Is = Ip * sin(w * t + phi_rad);
figure(1);
plot(t, Vs, t, Is);
title('Simulated Signal');
xlabel('time [s]');
legend('Voltage [V]', 'Current [A]');
grid;

# Calculation Power Phactor of Simulated Signal
Ps = Vs .* Is;
figure(2);
plot(t, Ps);
grid;

# Find Zero Crossing point of Ps
#t0 = zerocrossing(t, Ps);  % error: 'zerocrossing' undefined near line 3, column 5

% Frequency Estimation at Transmitter
% Counting Zero Crossings
t0=[];
Ps0=[];
for n=1:length(Ps)-1
  if Ps(n)>0 && Ps(n+1)<0   % -ve going
    t0(end+1)= interp1([Ps(n) Ps(n+1)], [t(n) t(n+1)], 0);
  end
  if Ps(n)<0 && Ps(n+1)>0   % +ve going
    t0(end+1)= interp1([Ps(n) Ps(n+1)], [t(n) t(n+1)], 0);
  end
end
% We have 2 zero crossings per period
dt1 = t0(3) - t0(2)
dt2 = t0(4) - t0(3)
phi_m = 360 / (dt2 + dt1) / 2 * dt2
Vs_m = max(Vs) / sqrt(2)   # Vpeak / sqrt(2)
Is_m = max(Is) / sqrt(2)
Power =  Vs_m * Is_m * abs(cos(phi_m))

plot(t, Ps, t0, zeros(1,length(t0)), 'ob')

# disp('Ps>0');
# find(Ps>0)
# disp('Ps<0');
# find(Ps<0)
