% ����������ֵ�����õ� MATLAB ���ڲ����������Ͻ����˵�һ���������ֱ߽������µĲ�ֵ�㷨

clear;close all;format long;clc;
x0=[0 3 5 7 9 11 12 13 14 15]; % ����ֵ�����ݵ�
y0=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6]; 

dx=0.05;% ������������ֵ����ʽ���ص�����ʱѡȡ�Ĳ���
xx=min(x0):dx:max(x0);

% y3=spline(x0,y0,xx); 
% plot(x0,y0,'ro',xx,y3);%�������� 
% hold on;

pp=csape(x0,y0,'not-a-knot');% ����߽������ĺ���������ע����ʾ
y4=ppval(pp,xx); 
plot(x0,y0,'ro',xx,y4);

% function pp = csape(x,y,conds,valconds)
% pp=csape(x,y,'�������','�߽�ֵ'),���ɸ��ֱ߽�����������������ֵ. ����,(x,y)Ϊ��������
% �߽����Ϳ�Ϊ:
% 'complete',�����߽�һ�׵���.
% 'variational',��Ȼ����(�߽���׵���Ϊ0)
% 'periodic',�����Ա߽�����,���ø��߽�ֵ.
% 'second',�����߽���׵���. 
% 'not-a-knot',��Ť������,���ø��߽�ֵ.(��Ϊ MATLAB ����������ֵ spline���� Ĭ�ϵı߽�����)
% .
% �� ��������
% x | 1 2 4 5
% --|-------------
% y | 1 3 4 2
% �߽�����S''(1)=2.5,S''(5)=-3,
% x=[1 2 4 5];y=[1 3 4 2];
% pp=csape(x,y,'second',[2.5,-3]);
% xi=1:0.1:5;yi=ppval(pp,xi);
% plot(x,y,'o',xi,yi);