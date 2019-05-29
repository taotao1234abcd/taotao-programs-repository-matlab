% 埃尔米特插值多项式
% 书上只研究了两种典型一阶导数条件下的埃尔米特插值公式
% 本程序是在所有点一阶导数条件下的埃尔米特插值
clear;close all;format long;clc;

x0=[1 2 3 4 5 6]; % 待插值的数据点
y0=[3 -13 -11 4 -2 -7];
y1=[0 1 -1 1.5 3 -0.5]; % 给定的各个数据点处的一阶导数值

n=max(length(x0));

syms x;
y=0; 
for i=1:n 
    h=1.0; 
    a=0.0; 
    for j=1:n 
     if j~=i 
       h=h*((x-x0(j))/(x0(i)-x0(j)))^2; 
       a=1/(x0(i)-x0(j))+a; 
     end 
    end 
    y=y+h*((x0(i)-x)*(2*a*y0(i)-y1(i))+y0(i)); 
end

i=0;
dx=0.02; % 画图时选取的步长
xx=min(x0):dx:max(x0);
for x=min(x0):dx:max(x0)
    i=i+1;
    yy(i)=subs(y);
end

plot(xx,yy);
hold on;
plot(x0,y0,'*')

dy=diff(y);
y=vpa(simplify(y),5);
i=0;
for x=x0
    i=i+1;
    y1_get(i)=subs(dy);
end
y % 求得的埃尔米特插值多项式
y1 % 给定的各个数据点处的一阶导数值
y1_get=vpa(y1_get,5) % 得到的插值多项式在各数据点处的一阶导数值
















