clear;close all;clc;

syms x a b c

S1 = x^2 + a*x + b*x + 1;
S2 = x^2 + 3*b*x + 2*a*x;
S11 = diff(S1,'x',1);
S21 = diff(S2,'x',1);
S22 = x-c;

[x, a, b] = solve([S11, S21, S22],[x, a, b])


% syms dVF dVR dVfd
% syms VF VR Vfd  
% syms dVt Vt Vref  
% syms KA TA KF TF KE TE SE

% E1 = KA*(Vref - Vt - VF) - (VR + TA*dVR);
% E2 = VF + TF*dVF - KF*dVfd;
% E3 = VR - Vfd*SE - KE*Vfd - TE*dVfd;
% [dVF,dVR,dVfd] = solve([E1, E2, E3],[dVF,dVR,dVfd])

