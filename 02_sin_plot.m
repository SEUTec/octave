#! /usr/bin/octave --persist
# Octave test file

# Array of numbers from -10 to 10 with 0.1 steps.
x = -10:0.1:10;  
# Calcs sin for all the numbers in the array.
y = sin (x);
plot(x, y);
