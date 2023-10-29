# Tank Draining simulation wiht ode45
# ode45 solves first order differential equations in standard form
#
# y = tank level
# Initial contitions, y(0) = 1      
#
# -dy/dt = 2 * y

clear all;
clc;

printf('Time Interval\n');
tini = 0
tend = 3

printf('\nInitial Conditions');
yini = 1

function dydt = tank_ode(t, y)
    dydt = -2 * y;
endfunction

# [t, y] = ode45(odefun, tspan, y0)
[t, y] = ode45(@(t,y) tank_ode(t, y), [tini, tend], yini);

plot(t, y)
