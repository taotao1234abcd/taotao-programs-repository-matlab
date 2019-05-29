% 拉格朗日插值多项式
clear;close all;format long;clc;

x0=[1 2 3 4 5 6]; % 待插值的数据点
y0=[3 -13 -11 4 -2 -7];

n=max(size(x0));
L=0;
A=1;
B=1;
syms x;
for k=1:n
    for i=1:n
        if k~=i
             A=A*(x-x0(i));
             B=B*(x0(k)-x0(i));
        end
    end
    lx=A/B;
    L=L+y0(k)*lx;
    A=1;
    B=1;
end

i=0;
dx=0.05;% 画图时选取的步长
xx=min(x0):dx:max(x0);
for x=min(x0):dx:max(x0)
    i=i+1;
    yy(i)=subs(L);
end

plot(xx,yy);
hold on;
plot(x0,y0,'*')

L=vpa(simplify(L),5);
L %求得的拉格朗日插值多项式





