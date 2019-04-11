clear;close all;format long;clc;


% tic
% for i=1:10000
%     for j=1:10000
%         a(i,j)=i*j;        
%     end
% end
% toc


% 
% myCluster = parcluster('local');
% delete(myCluster.Jobs);
% parpool('local',2);

tic
parfor i=1:10000
    for j=1:10000
        a(i,j)=i*j;        
    end
end
toc

