clear;close all;format long;clc;

bounds = zeros(3,2);
bounds(:,1) = -2;
bounds(:,2) = 2;

GA_options=gaoptimset('Generations',10000,'PlotFcns',{[]},'PopulationSize',10000,'TolFun',1e-12);
% [X,fval]=ga(@fitness,66,A,b,[],[],bounds(:,1),bounds(:,2),[],1:66,GA_options);
[X,fval]=ga(@fitness,3,[],[],[],[],bounds(:,1),bounds(:,2),[],[],GA_options)


function [val]=fitness(X)
val = (X(1)-1)^2 + (X(2)-1.5)^2 + (X(3)+0.5)^2;
end