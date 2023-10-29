# RL Circuit with ODE
#
# We have a Voltage power supply, a Resistor and an Inductor connected in serie
#
# Vs Voltage supply Constant
#
# di(t)/dt = (Vs - Rs * i(t)) / L

clear all;
clc;

printf('RL Serie Circuit with ode45\n');
Vs = 12     # Volts
Rs = 0.5    # Ohms
L = 1e-3    # Farads

printf('\nTime Interval\n');
tini = 0
tau = L / Rs
tend = tau * 6

printf('\nInitial Conditions\n');
iLini = 0

function diLdt = RL_ode(t, iL, Vs, Rs, L)
    # di(t)/dt = (Vs - Rs * i(t)) / L
    #diLdt = (12 - 0.5 * iL) / 1e-3;
    diLdt = (Vs - Rs * iL) / L;
endfunction

# [t, y] = ode45(odefun, tspan, y0)
#[t, y] = ode45(@(t,y) tank_ode(t, y), [tini, tend], yini);

[t, iL] = ode45(@(t,iL) RL_ode(t, iL, Vs, Rs, L), [tini, tend], iLini);

plot(t, iL);


