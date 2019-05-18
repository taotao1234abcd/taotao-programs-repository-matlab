clear;clc;close all;

% 文件名不能用中文必须用英文，文件名开头不能是数字，否则程序无法运行


% fprintf("hello world!\n");

% x = input('请输入x的值：');  % 注意只能使用单引号，否则可能报错
% fprintf("x = %d\n",x);


x = [
    1	2	3
    4	5	6
    ];

x2 = [
    3   6   7
    7  -1  -5
    ];

x3 = [x;x2];

% size(x, 1)
% size(x, 2)


% x = [];

% y = zeros(2,3);

% y = zeros(size(x, 1),size(x, 2));

% y = ones(size(x, 1),size(x, 2));

% y = eye(3);


% x(2,1)

% x(2,:)

% x(2,1:2)

% x(1:2,1:2)

% x(1:2,2:end)

% x3 = [x x2];

% x3 = [x;x2];

% x
% x(:,2:3)=[]

% x3 = [x zeros(2,3); zeros(2,3) x2]

% x3 = [x zeros(size(x,1),size(x2,2)); zeros(size(x2,1),size(x,2)) x2]

% x3 = zeros(4,6);
% x3(1:2,1:3) = x;
% x3(3:4,4:6) = x2;

% x3 = sort(x3); 
% x3 = sort(x3,2);

% x3 = sortrows(x3,2);


clear x
clear x2 x3  % 清除内存中的变量

% 
% A = [
%     1	   2	3
%     4	  -1	6
%     3   -5    5
%     ];
% 
% b = [
%     5
%     17
%     18
%     ];
% 
% det(A)  % 返回A的行列式的值
% 
% rref(A)  % 简化行阶梯行
% 
% A.^-1  % 逆矩阵
% A^-1*b  
% inv(A)  % 逆矩阵
% inv(A)*b 
% 
% A\b  % 快速求解线性方程组Ax=b，若无解则使用最小二乘法给出近似解

% [V, D] = eig(A)  % 返回A的特征值和特征向量
% 
% [V, J] = jordan(A)  % 返回A的约当标准型J和对应的相似变换矩阵V


