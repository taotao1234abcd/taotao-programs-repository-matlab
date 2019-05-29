% 牛顿均差插值多项式
clear;close all;format long;clc;

x0=[1 2 3 4 5 6]; % 待插值的数据点
y0=[3 -13 -11 4 -2 -7];

n=max(size(x0));
C(:,1)=y0';

for i=2:n
    for j=2:i
        C(i,j)=(C(i,j-1)-C(i-1,j-1))/(x0(i)-x0(i-j+1));
    end
end

P=0;
syms x;
for i=1:n
    temp=C(i,i);
    for j=1:i-1
        temp=temp*(x-x0(j));
    end
    P=P+temp;
end

i=0;
dx=0.05;% 画图时选取的步长
xx=min(x0):dx:max(x0);
for x=min(x0):dx:max(x0)
    i=i+1;
    yy(i)=subs(P);
end

plot(xx,yy);
hold on;
plot(x0,y0,'*')

P=vpa(simplify(P),5);
P %求得的牛顿均差插值多项式







