clear;close all;format long;clc;

x = sdpvar(5,1);
A = randn(15,5);
b = rand(15,1)*10;

obj = sum(x) + sum((x-3).^4); % 4th order objective
ops = sdpsettings('solver','bmibnb','bmibnb.upper','fmincon');
optimize([A*x <= b, integer(x)],obj,ops)




% 程序运行的结果：

% * Starting YALMIP global branch & bound.
% * Branch-variables : 5
% * Upper solver     : fmincon
% * Lower solver     : CPLEX
% * LP solver        : CPLEX
%  Node       Upper      Gap(%)       Lower    Open
%     1 :    1.500E+01   198.93     -3.560E+02   2  Improved solution  
%     2 :    1.500E+01   198.93     -3.560E+02   3    
%     3 :    1.500E+01   198.90     -3.470E+02   4    
%     4 :    1.500E+01   198.90     -3.470E+02   5    
%     5 :    1.500E+01   198.47     -2.450E+02   6    
%     6 :    1.500E+01   198.47     -2.450E+02   7    
%     7 :    1.500E+01   198.40     -2.330E+02   8    
%     8 :    1.500E+01   198.40     -2.330E+02   9    
%     9 :    1.500E+01   198.31     -2.200E+02  10    
%    10 :    1.500E+01   198.31     -2.200E+02  11    
%    11 :    1.500E+01   197.52     -1.440E+02  12    
%    12 :    1.500E+01   197.52     -1.440E+02  11  Poor bound  
%    13 :    1.500E+01   197.14     -1.230E+02  12    
%    14 :    1.500E+01   197.14     -1.230E+02  11  Poor bound  
%    15 :    1.500E+01   196.90     -1.120E+02  12    
%    16 :    1.500E+01   196.90     -1.120E+02  13    
%    17 :    1.500E+01   195.12     -6.500E+01  14    
%    18 :    1.500E+01   195.12     -6.500E+01  15    
%    19 :    1.500E+01   195.06     -6.400E+01  16    
%    20 :    1.500E+01   195.06     -6.400E+01  16    
%    21 :    1.500E+01   194.94     -6.200E+01  15  Poor bound  
%    22 :    1.500E+01   194.94     -6.200E+01  14  Poor bound  
%    23 :    1.500E+01   192.86     -3.900E+01  13  Poor bound  
%    24 :    1.500E+01   192.86     -3.900E+01  12  Poor bound  
%    25 :    1.500E+01   189.74     -2.200E+01  11  Poor bound  
%    26 :    1.500E+01   189.74     -2.200E+01  10  Poor bound  
%    27 :    1.500E+01   189.19     -2.000E+01   9  Poor bound  
%    28 :    1.500E+01   189.19     -2.000E+01   8  Poor bound  
%    29 :    1.500E+01   187.50     -1.500E+01   7  Poor bound  
%    30 :    1.500E+01   185.71     -1.100E+01   8    
%    31 :    1.500E+01   185.71     -1.100E+01   7  Infeasible  
%    32 :    1.500E+01   177.78     -1.000E+00   6  Infeasible  
%    33 :    1.500E+01   177.78     -1.000E+00   5  Infeasible  
%    34 :    1.500E+01   155.56      1.000E+00   4  Poor bound  
%    35 :    1.500E+01   155.56      1.000E+00   3  Infeasible  
%    36 :    1.500E+01    13.33      1.300E+01   2  Infeasible  
%    37 :    1.500E+01    13.33      1.300E+01   1  Infeasible  
%    38 :    1.500E+01     0.00      1.500E+01   0  Infeasible  
% * Finished.  Cost: 15 Gap: 0
% * Termination with all nodes pruned 
% * Timing: 5% spent in upper solver (20 problems solved)
% *         23% spent in lower solver (41 problems solved)
% *         59% spent in LP-based domain reduction (503 problems solved)
% 
% ans = 
% 
%   包含以下字段的 struct:
% 
%     yalmipversion: '20181012'
%        yalmiptime: 0.100999999999999
%        solvertime: 2.380000000000003
%              info: 'Successfully solved (BMIBNB)'
%           problem: 0
%           
%           
