% �������ز�ֵ����ʽ
% ����ֻ�о������ֵ���һ�׵��������µİ������ز�ֵ��ʽ
% �������������е�һ�׵��������µİ������ز�ֵ����Ҫ������
clear;close all;format long;clc;

x0=[1 2 3 4 5 6]; % ����ֵ�����ݵ�
y0=[3 -13 -11 4 -2 -7];
y1=[0 1 -1 1.5 3 -0.5]; % �����ĸ������ݵ㴦��һ�׵���ֵ

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
dx=0.02; % ��ͼʱѡȡ�Ĳ���
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
y % ��õİ������ز�ֵ����ʽ
y1 % �����ĸ������ݵ㴦��һ�׵���ֵ
y1_get=vpa(y1_get,5) % �õ��Ĳ�ֵ����ʽ�ڸ����ݵ㴦��һ�׵���ֵ















