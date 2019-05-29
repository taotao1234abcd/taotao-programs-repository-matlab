% 多项式拟合，调用的 MATLAB 的内部函数
% 常用 MATLAB 拟合工具箱 cftool 来处理各式各样的数据拟合
clear;close all;format long;clc;

x=[0 3 5 7 9 11 12 13 14 15]; % 待拟合的数据点
y=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6]; 
x0=x;

nmax=7; % 设定的拟合多项式的最大阶数
eps=1e-4; % 设定的在数据点处y值的偏差的目标值

for i=1:nmax
    y2=polyfit(x,y,i);
    Y=polyval(y2,x); % 尝试使用最小的阶数来拟合
    if max(abs(Y-y))<eps
        n=i;  
        break;
    end
end

syms x f(x)
f=poly2sym(y2,x);

i=0;
dx=0.1;% 画图时选取的步长
xx=min(x0):dx:max(x0);
for x=min(x0):dx:max(x0)
    i=i+1;
    yy(i)=subs(f);
end

plot(xx,yy);
hold on;
plot(x0,y,'*')

f=vpa(simplify(f),5)
eps=max(abs(Y-y)) % 得到的拟合多项式在数据点处y值的偏差的最大值








