%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     FREQUENCY ESTIMATION
%            USING
%     ZERO CROSSING METHOD
%       www.raymaps.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://www.raymaps.com/index.php/frequency-estimation-using-zero-crossing-method/
%
% Modified by Sebastian Jardi Estadella

clear all
#close all

fc=1e3;             % Carrier frequency
fs=fc*10;           % Sampling frequency
ts=1/fs;            % Sampling interval
N=100;              % Number Samples
t=0:ts:N*ts;        % Total time
dp=pi/6;            % Phase offset
df=20e3;            % Frequency offset

tx_carrier = sqrt(2) * cos(2*pi*fc*t);
rx_carrier = sqrt(2) * cos(2*pi*(fc+df) * t+dp) + 0.1 * randn(1, N+1);

figure(1);
plot(t, tx_carrier, t, rx_carrier);
legend('tx', 'rx');

% Frequency Estimation at Transmitter
% Counting Zero Crossings
count=0;
for n=1:N
  if tx_carrier(n)>0 && tx_carrier(n+1)<0   % -ve going
    count=count+1;
  end
  if tx_carrier(n)<0 && tx_carrier(n+1)>0   % +ve going
    count=count+1;
  end
end
% We have 2 zero crossings per period
% t(end) = Last value of t array
#tx_freq_estimate=count/2/t(end)
tx_freq_estimate=count/2/(t(end)-t(1))

% Frequency Estimation at Receiver
count=0;
for n=1:N
  if rx_carrier(n)>0 && rx_carrier(n+1)<0   % -ve going
    count=count+1;
  end
  if rx_carrier(n)<0 && rx_carrier(n+1)>0   % +ve going
    count=count+1;
  end
end
rx_freq_estimate=count/2/t(end)

% Fourier Transform
two_tones=tx_carrier+rx_carrier;
fft_two_tones=abs(fft(two_tones));
fft_two_tones=fft_two_tones/max(fft_two_tones);
f=0:1/t(end):(N)*(1/t(end));
figure(2);
plot(f,10*log10(fft_two_tones),'linewidth',3);
axis([fc-2*df fc+2*df -15 5])
xlabel('Frequency')
ylabel('Magnitude')
title('Fourier Transform')
grid on