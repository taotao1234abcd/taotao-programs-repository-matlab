% 超松弛迭代法(SOR)
clear;close all;format long;clc;

% A=[10,-1,-2;-1,10,-2;-1,-1,5];
% b=[72,83,42]';

% A=[ 28,-3,0,0,0;
%     -3,38,-10,0,-5;
%     -10,0,25,-15,0;
%     0,0,-15,45,0;
%     0,-5,0,0,30];
% b=[10,0,0,0,0]';

A=[-4 1 1 1
    1 -4 1 1
    1 1 -4 1
    1 1 1 -4];
b=[1 1 1 1]';

% A=[0 1 1 1
%    1 0 1 1
%    1 1 0 1
%    1 1 1 0];   % 此方程组难以使用迭代法求解，可以用高斯消去法进行求解
% b=[87.4 101.6 99.2 115.7]';

N=length(b);    %解向量的维数
fprintf('MATLAB内部函数的计算结果：');
x=A\b      %库函数计算结果
x=zeros(N,1);%迭代初始值取为0向量
x1=x;

eps=1e-5;%相邻解的向量距离小于该数时，结束迭代
omiga=1.0;%松弛因子，在(0,2)取值才可能收敛，取1.0则为高斯-塞德尔迭代法
if omiga<=0 || omiga>=2
    error('松弛因子不在(0,2)区间内，迭代求解无法收敛')
end

D=diag(diag(A));
L=-tril(A,-1);%下三角
U=-triu(A,1);%上三角
Lomiga=(D-omiga*L)\((1-omiga)*D+omiga*U);
try 
    if max(abs(eig(Lomiga)))>=1
    error('本程序的迭代求解无法收敛');
    end
catch
    error('本程序的迭代求解无法收敛')
end

%--------开始迭代-------
k=0;
while(1)
    k=k+1;
    for i=1:N
         temp1=0;
        for j=1:i-1
            temp1=temp1+A(i,j)*x1(j);
        end
        temp2=0;
        for j=i:N
            temp2=temp2+A(i,j)*x(j);
        end
        x1(i)=x(i)+omiga*(b(i)-temp1-temp2)/A(i,i);
    end
    if norm(x1-x)<eps   
        break;
    end
    x=x1;
end
x=x1;
fprintf('本程序的计算结果：');
x
fprintf('本程序的迭代次数：');
k




