% ��������ֵ������
clear;close all;format long;clc;

f=inline('4./(1+x.^2)'); % ��������

a=0; % ��������Ϊ(a,b)
b=1;
n=2^6; % �������仮��Ϊn��С������ʹ��������ʽ
k=6; % ��ÿ��С����ʹ��k�ζ��ֵ�������ʽ

L=(b-a)/n;
S=0;

for j=0:n-1
    x1=a+j*L;
    x2=a+(j+1)*L;
    for m=1:k+1
    len=(x2-x1)/2^(m-1);
    T(m,1)=(x2-x1)/2^(m-1)*(f(x1)+2*sum(f(x1+len*(1:2^(m-1)-1)))+f(x2))/2;
    end

    for i=2:k+1
        for m=2:i
            temp=m-1;
            T(i,m)=4^temp/(4^temp-1)*T(i,m-1)-1/(4^temp-1)*T(i-1,m-1);
        end
    end
    S=S+T(k+1,k+1);
    T=0;
end
S % ��õĶ����ֵ�ֵ



