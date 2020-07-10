% ����ʽ��ϣ����õ� MATLAB ���ڲ�����
% ���� MATLAB ��Ϲ����� cftool ��������ʽ�������������
clear;close all;format long;clc;

x=[0 3 5 7 9 11 12 13 14 15]; % ����ϵ����ݵ�
y=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6]; 
x0=x;

nmax=7; % �趨����϶���ʽ��������
eps=1e-4; % �趨�������ݵ㴦yֵ��ƫ���Ŀ��ֵ

for i=1:nmax
    y2=polyfit(x,y,i);
    Y=polyval(y2,x); % ����ʹ����С�Ľ��������
    if max(abs(Y-y))<eps
        n=i;  
        break;
    end
end

syms x f(x)
f=poly2sym(y2,x);

i=0;
dx=0.1;% ��ͼʱѡȡ�Ĳ���
xx=min(x0):dx:max(x0);
for x=min(x0):dx:max(x0)
    i=i+1;
    yy(i)=subs(f);
end

plot(xx,yy);
hold on;
plot(x0,y,'*')

f=vpa(simplify(f),5)
eps=max(abs(Y-y))







