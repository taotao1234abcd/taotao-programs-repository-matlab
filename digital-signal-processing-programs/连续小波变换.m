clear;close all;clc;

fs=2^6;    %采样频率
dt=1/fs;    %时间精度
timestart=0;
timeend=20;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);

s = 4*sin(2*pi*linspace(6,12,L).*t) + 4*sin(2*pi*linspace(12,6,L).*t);


cwt(s, fs);


figure;

%matlab自带的小波变换
%新版本

% cwt(s, fs)
% wsst(s,fs)

[wt,wf,coi] = cwt(s, fs);
% pcolor(t,f,abs(wt));shading interp

[sst,ssf] = wsst(s,fs);
% pcolor(t,f,abs(sst));shading interp


subplot(311)
plot(t, s)
axis tight;
title('Signal')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(312)
surface(t, wf, abs(wt))
axis tight;
shading flat;
title('Continuous Wavelet Transform')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
set(gca,'yscale','log')

subplot(313)
surface(t, ssf, abs(sst))
axis tight;
shading flat;
title('Wavelet Synchrosqueezed Transform')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
set(gca,'yscale','log')





