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
#sT = 26;            # Samples per Period
#sT = 36;            # Samples per Period
sT = 360;            # Samples per Period


#t = 0:T/sT:nT*T;     # Array of time
t = linspace(0, nT*T, sT*nT);
Vs = Vp * sin(w * t);
# Simulated Current fir testing
Ip = Vp / 10;
phi_deg = 0;     # PF = 1, calculation error
#phi_deg = -0.6;     # PF = 1, min value with non calculation error
phi_deg = -10;   # PF = 0.9848
#phi_deg = -20;   # PF = 9397
#phi_deg = -30;   # PF = 0.8660
#phi_deg = -40;   # Capacitive Load.
                # > 0, Current advanced over Voltage
                # Inductive Load, AC Motor.
                # < 0, Current delayed over Voltage
phi_rad = phi_deg / 360 * 2 * pi;
PF = abs(cos(phi_rad))
Is = Ip * sin(w * t + phi_rad);
figure(1);
plot(t, Vs, t, Is*10);
title('Simulated Signal');
xlabel('time [s]');
legend('Voltage [V]', 'Current [A x10]');
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
i0=[];  # Index where we will insert el 0 value
for n=1:length(Ps)-1
  if Ps(n)>0 && Ps(n+1)<0   % from + to -
    i0(end+1) = n+1;
    t0(end+1) = interp1([Ps(n) Ps(n+1)], [t(n) t(n+1)], 0);
  end
  if Ps(n)<0 && Ps(n+1)>0   % from - to +
    i0(end+1) = n+1;
    t0(end+1) = interp1([Ps(n) Ps(n+1)], [t(n) t(n+1)], 0);
  end
end

# Insert del points where value is 0
for n = 1:length(t0)
    pos = length(t0)-n+1;
    #t0(pos)
    # Insert new interpolated value in the arrays after n
    t = [t(1:i0(pos)-1), t0(pos), t(i0(pos):end)];
    Ps = [Ps(1:i0(pos)-1), 0, Ps(i0(pos):end)];
end

# Update Indexes for zeros cross
i0=[];
for n = 1:length(Ps)
  if Ps(n) == 0
    i0(end+1) = n;
  end
end

% We have 2 zero crossings per period
dt1 = t0(3) - t0(2)
dt2 = t0(4) - t0(3)
phi_m_deg = 360 / (dt2 + dt1) / 2 * dt2
phi_m_rad = pi / (dt2 + dt1) * dt2
PF_m = abs(cos(phi_m_rad))
Vs_m = max(Vs) / sqrt(2)   # Vpeak / sqrt(2)
Is_m = max(Is) / sqrt(2)
Ps_m =  Vs_m * Is_m * PF

printf('\nEnergy, Veff * Ieff * PF * T in one Period\n');
Ps_m =  Vs_m * Is_m * PF * T  # Power * T time = W*s

# Integer number of periods of signal
Np = 1;
# 1 Period of the signal = 2 periods of power
Npp = Np * 2;
Ini = 2;
tp = [];
Psp = [];
for n = 1:length(Ps)
  if n >= i0(Ini) && n <= i0(Npp*2+Ini)
    tp(end+1) = t(n);
    Psp(end+1) = Ps(n);
  end
end

plot(t, Ps, tp, Psp, 'r')
grid;

printf('\nEnergy by Itegration of V .* I in one period.\n');
Es = trapz(tp, Psp) / Np  # Watts * s

# Another way to get Power Factor, NOT WORKING YET
#print('\nEnergy by Effectiva values.\n');
#Veff
#Ieff = Ip / sqrt(2)
#Pseff = Veff * Ieff
#PF2 =  Ps_m / Pseff
#Eeff = Pseff * T  # Power * T time = W*s