% ��΢�ַ�����ֵ�� �Ľ�ŷ��������ʽ���η� �� 4�׹̶��������������
clear;close all;format long;clc;

Dy=inline('y-2*x/y'); %������һ�׳�΢�ַ���
h=0.01; % ��ⲽ��
xspan=0:h:15; %�������
y0=1; %��ֵ
jqj=dsolve('Dy=y-2*x/y','y(0)=1','x'); % ���ľ�ȷ��

x=min(xspan);
y=y0;
n=1;
while(x(n)+h<=max(xspan)) % �Ľ�ŷ������������ʽ���η��Ľ�����������ȡΪ1��
    x(n+1)=x(n)+h;
    
    %     yp=y(n)+h*Dy(x(n),y(n));
    %     yc=y(n)+h*Dy(x(n+1),yp);
    %     y(n+1)=0.5*(yp+yc);
    
    y(n+1)=y(n)+h*Dy(x(n),y(n));

    y(n+1)=y(n)+0.5*h*(Dy(x(n),y(n))+Dy(x(n+1),y(n+1)));

    
    n=n+1;
end
plot(x,y,'--');
hold on;

x=min(xspan);
y=y0;
n=1;
while(x(n)+h<=max(xspan)) % ��ʽ���η�����ʽŷ������
    x(n+1)=x(n)+h;
    y(n+1)=y(n)+h*Dy(x(n),y(n));
    for iii=1:3
        y(n+1)=y(n)+0.5*h*(Dy(x(n),y(n))+Dy(x(n+1),y(n+1)));
    end
    n=n+1;
end
plot(x,y,'k');
hold on;


x(1)=min(xspan);
y(1)=y0;
n=floor((max(xspan)-min(xspan))/h);
for i=1:n                % 4�����������
    x(i+1)=x(i)+h;
    K1=Dy(x(i),y(i));
    K2=Dy(x(i)+h/2,y(i)+h/2*K1);
    K3=Dy(x(i)+h/2,y(i)+h/2*K2);
    k4=Dy(x(i)+h,y(i)+h*K3);
    y(i+1)=y(i)+h/6*(K1+2*K2+2*K3+k4);
end
plot(x,y,'b');
hold on;

yr=subs(jqj);
plot(x,yr,'r');

axis([min(xspan),max(xspan),double(min(yr)-0.2*max(abs(yr))),double(max(yr)+0.2*max(abs(yr)))]);


legend('�Ľ�ŷ����','��ʽ���η�','4�����������','��ȷ��')



