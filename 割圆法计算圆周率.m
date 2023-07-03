clear;close all;clc;format long;

% n = 6;
% x = 1/2;
% err = 999;
% iter = 0;
% while 1
%     iter = iter + 1
%     pai = n*2*x/2
%     x = 0.5*sqrt(2 - 2*sqrt(1 - x^2));
%     n = 6*2^iter;
%     if abs(pai - pi) < err
%         err = abs(pai - pi);
%     else
%         break
%     end
% end


% n = 6;
% x = 1/2;
% S = sqrt(3)/4*6;
% err = 999;
% iter = 0;
% while 1
%     iter = iter + 1
%     pai = S
%     dh = 1 -  sqrt(1 - x^2);
%     dS = n*2*x*dh/2;
%     S = S + dS;
%     x = 0.5*sqrt(2 - 2*sqrt(1 - x^2));
%     n = 6*2^iter;
%     if abs(pai - pi) < err
%         err = abs(pai - pi);
%     else
%         break
%     end
% end


x = 1e-9;
e = (1+x)^(1/x)

% e = 0;
% for iter = 1:20
%     e = e + 1/factorial(iter)
% end

