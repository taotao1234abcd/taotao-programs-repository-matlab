% 三次样条插值，调用的 MATLAB 的内部函数，书上介绍了第一、二、三种边界条件下的插值算法

clear;close all;format long;clc;
x0=[0 3 5 7 9 11 12 13 14 15]; % 待插值的数据点
y0=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6]; 

dx=0.05;% 求三次样条插值多项式返回的数据时选取的步长
xx=min(x0):dx:max(x0);

% y3=spline(x0,y0,xx); 
% plot(x0,y0,'ro',xx,y3);%画出曲线 
% hold on;

pp=csape(x0,y0,'not-a-knot');% 具体边界条件的含义见下面的注释所示
y4=ppval(pp,xx); 
plot(x0,y0,'ro',xx,y4);

% function pp = csape(x,y,conds,valconds)
% pp=csape(x,y,'变界类型','边界值'),生成各种边界条件的三次样条插值. 其中,(x,y)为数据向量
% 边界类型可为:
% 'complete',给定边界一阶导数.
% 'variational',自然样条(边界二阶导数为0)
% 'periodic',周期性边界条件,不用给边界值.
% 'second',给定边界二阶导数. 
% 'not-a-knot',非扭结条件,不用给边界值.(此为 MATLAB 三次样条插值 spline函数 默认的边界条件)
% .
% 例 考虑数据
% x | 1 2 4 5
% --|-------------
% y | 1 3 4 2
% 边界条件S''(1)=2.5,S''(5)=-3,
% x=[1 2 4 5];y=[1 3 4 2];
% pp=csape(x,y,'second',[2.5,-3]);
% xi=1:0.1:5;yi=ppval(pp,xi);
% plot(x,y,'o',xi,yi);