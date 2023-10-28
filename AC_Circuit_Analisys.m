#! /usr/bin/octave -qf --persist
# AC Circuit Analysis
#
# run this file with:  ./AC_Circcuit_Analisys.m
# or: octave --persist AC_Circcuit_Analisys.m
#
# Ref:  
# AC circuit analysis and simulation using Octave and LTspice
# https://www.youtube.com/watch?v=JTKgzuSNILs
#
# Circuit Description:
# 1 AC Voltage source (230 Vrms, sin, 50 Hz) in parallel to two branch
# 1 branch wirh R1 ( 1 kOhm ) and C ( 2.2 uF )
# 1 branch wirh R2 ( 20 kOhm ) and L ( 50 mH )

# Frequency
f = 50;             # Hz
w = 2 * pi * f;     # rad/s

# Reference Phasor
Vs = 230;           # Volts

# Circuit Elements
R1 = 1e3;           # Ohms
C = 2.2e-6;         # Farads
R2 = 20;            # Ohms
L = 50e-3;          # Henris

# Calculate Impedance
ZL = j * w * L
ZC = 1 / (j * w * C)

# Calculate Current Phasors
IC = Vs / ( R1 + ZC )
IL = Vs / ( R2 + ZL )

# Calculate Voltage Phasors
VC = IC * ZC
VL = IL * ZL

# Calculate peak and rms magnitudes of VC and IC
VCrms = abs(VC)
VCpeak = sqrt(2) * VCrms

ICrms = abs(IC)
ICpeak = sqrt(2) * ICrms