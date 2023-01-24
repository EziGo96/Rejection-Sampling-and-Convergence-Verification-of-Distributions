clc;clear;close all;
% Matlab routine RV generation
rng(42)
sz_100 = [1 100];
sz_1000 = [1 1000];
sz_10000 = [1 10000]; 

x_norm_100_routine = normrnd(2,sqrt(2),sz_100).';
x_norm_1000_routine = normrnd(2,sqrt(2),sz_1000).';
x_norm_10000_routine = normrnd(2,sqrt(2),sz_10000).';

x_unif_100_routine = unifrnd(2,4,sz_100).';
x_unif_1000_routine = unifrnd(2,4,sz_1000).';
x_unif_10000_routine = unifrnd(2,4,sz_10000).';

x_exp_100_routine = exprnd(1/2,sz_100).';
x_exp_1000_routine = exprnd(1/2,sz_1000).';
x_exp_10000_routine = exprnd(1/2,sz_10000).';

% Matlab routine RV histogram plots
figure;
histogram(x_norm_100_routine,10,'Normalization', 'pdf');
title('x-norm-100-routine-histogram');
figure;
histogram(x_norm_1000_routine,100,'Normalization', 'pdf');
title('x-norm-1000-routine-histogram');
figure;
histogram(x_norm_10000_routine,500,'Normalization', 'pdf');
title('x-norm-10000-routine-histogram');

figure;
histogram(x_unif_100_routine,10,'Normalization', 'pdf');
title('x-unif-100-routine-histogram');
figure;
histogram(x_unif_1000_routine,100,'Normalization', 'pdf');
title('x-unif-1000-routine-histogram');
figure;
histogram(x_unif_10000_routine,500,'Normalization', 'pdf');
title('x-unif-10000-routine-histogram');

figure;
histogram(x_exp_100_routine,10,'Normalization', 'pdf');
title('x-exp-100-routine-histogram');
figure;
histogram(x_exp_1000_routine,100,'Normalization', 'pdf');
title('x-exp-1000-routine-histogram');
figure;
histogram(x_exp_10000_routine,500,'Normalization', 'pdf');
title('x-exp-10000-routine-histogram');

% Matlab routine RV empirical parameter estimation
param_x_norm_100_routine=fitdist(x_norm_100_routine,'Normal');
disp(param_x_norm_100_routine);
param_x_norm_1000_routine=fitdist(x_norm_1000_routine,'Normal');
disp(param_x_norm_1000_routine);
param_x_norm_10000_routine=fitdist(x_norm_10000_routine,'Normal');
disp(param_x_norm_10000_routine);

c_unif_100_routine = (max(x_unif_100_routine) - min(x_unif_100_routine)) / length(x_unif_100_routine);
a_unif_100_routine= min(x_unif_100_routine) - c_unif_100_routine;
b_unif_100_routine = max(x_unif_100_routine) + c_unif_100_routine;
disp('Uniform distribution');
fprintf('a = %d\n',a_unif_100_routine);
fprintf('b = %d\n',b_unif_100_routine);
c_unif_1000_routine = (max(x_unif_1000_routine) - min(x_unif_1000_routine)) / length(x_unif_1000_routine);
a_unif_1000_routine= min(x_unif_1000_routine) - c_unif_1000_routine;
b_unif_1000_routine = max(x_unif_1000_routine) + c_unif_1000_routine;
disp('Uniform distribution');
fprintf('a = %d\n',a_unif_1000_routine);
fprintf('b = %d\n',b_unif_1000_routine);
c_unif_10000_routine = (max(x_unif_10000_routine) - min(x_unif_10000_routine)) / length(x_unif_10000_routine);
a_unif_10000_routine= min(x_unif_10000_routine) - c_unif_10000_routine;
b_unif_10000_routine = max(x_unif_10000_routine) + c_unif_10000_routine;
disp('Uniform distribution');
fprintf('a = %d\n',a_unif_10000_routine);
fprintf('b = %d\n',b_unif_10000_routine);

param_x_exp_100_routine=fitdist(x_exp_100_routine,'Exponential');
disp(param_x_exp_100_routine);
param_x_exp_1000_routine=fitdist(x_exp_1000_routine,'Exponential');
disp(param_x_exp_1000_routine);
param_x_exp_10000_routine=fitdist(x_exp_10000_routine,'Exponential');
disp(param_x_exp_10000_routine);




% Simulation of RV by rejection method

% using standard Uniform(0,1) distribution as the generating function
g_100 = rand(2*(sz_100(2)),sz_100(1));
g_1000 = rand(2*(sz_1000(2)),sz_1000(1));
g_10000 = rand(2*(sz_10000(2)),sz_10000(1));

% RV simulation
Norm_pdf=@Norm_pdf;

N = sz_100(2);
x_norm_100_simulated = Rejection_sampling(Norm_pdf,g_100,Norm_pdf(2),N,[-3,7]);
N = sz_1000(2);
x_norm_1000_simulated = Rejection_sampling(Norm_pdf,g_1000,Norm_pdf(2),N,[-3,7]);
N = sz_10000(2);
x_norm_10000_simulated = Rejection_sampling(Norm_pdf,g_10000,Norm_pdf(2),N,[-3,7]);

Unif_pdf=@Unif_pdf;
N = sz_100(2);
x_unif_100_simulated = Rejection_sampling(Unif_pdf,g_100,Unif_pdf(3),N,[2,4]);
N = sz_1000(2);
x_unif_1000_simulated = Rejection_sampling(Unif_pdf,g_1000,Unif_pdf(3),N,[2,4]);
N = sz_10000(2);
x_unif_10000_simulated = Rejection_sampling(Unif_pdf,g_10000,Unif_pdf(3),N,[2,4]);

Exp_pdf=@Exp_pdf;
N = sz_100(2);
x_exp_100_simulated = Rejection_sampling(Exp_pdf,g_100,Exp_pdf(0),N,[0,4]);
N = sz_1000(2);
x_exp_1000_simulated = Rejection_sampling(Exp_pdf,g_1000,Exp_pdf(0),N,[0,4]);
N = sz_10000(2);
x_exp_10000_simulated = Rejection_sampling(Exp_pdf,g_10000,Exp_pdf(0),N,[0,4]);

% Histogram of simulated RVs
figure;
histogram(x_norm_100_simulated,10,'Normalization', 'pdf');
title('x-norm-100-simulated-histogram');
figure;
histogram(x_norm_1000_simulated,100,'Normalization', 'pdf');
title('x-norm-1000-simulated-histogram');
figure;
histogram(x_norm_10000_simulated,500,'Normalization', 'pdf');
title('x-norm-10000-simulated-histogram');

figure;
histogram(x_unif_100_simulated,10,'Normalization', 'pdf');
title('x-unif-100-simulated-histogram');
figure;
histogram(x_unif_1000_simulated,100,'Normalization', 'pdf');
title('x-unif-1000-simulated-histogram');
figure;
histogram(x_unif_10000_simulated,500,'Normalization', 'pdf');
title('x-unif-10000-simulated-histogram');

figure;
histogram(x_exp_100_simulated,10,'Normalization', 'pdf');
title('x-exp-100-simulated-histogram');
figure;
histogram(x_exp_1000_simulated,100,'Normalization', 'pdf');
title('x-exp-1000-simulated-histogram');
figure;
histogram(x_exp_10000_simulated,500,'Normalization', 'pdf');
title('x-exp-10000-simulated-histogram');

% Simulated RV empirical parameter estimation
param_x_norm_100_simulated=fitdist(x_norm_100_simulated,'Normal');
disp(param_x_norm_100_simulated);
param_x_norm_1000_simulated=fitdist(x_norm_1000_simulated,'Normal');
disp(param_x_norm_1000_simulated);
param_x_norm_10000_simulated=fitdist(x_norm_10000_simulated,'Normal');
disp(param_x_norm_10000_simulated);

c_unif_100_simulated = (max(x_unif_100_simulated) - min(x_unif_100_simulated)) / length(x_unif_100_simulated);
a_unif_100_simulated= min(x_unif_100_simulated) - c_unif_100_simulated;
b_unif_100_simulated = max(x_unif_100_simulated) + c_unif_100_simulated;
disp('Uniform distribution');
fprintf('a = %d\n',a_unif_100_simulated);
fprintf('b = %d\n',b_unif_100_simulated);
c_unif_1000_simulated = (max(x_unif_1000_simulated) - min(x_unif_1000_simulated)) / length(x_unif_1000_simulated);
a_unif_1000_simulated= min(x_unif_1000_simulated) - c_unif_1000_simulated;
b_unif_1000_simulated = max(x_unif_1000_simulated) + c_unif_1000_simulated;
disp('Uniform distribution');
fprintf('a = %d\n',a_unif_1000_simulated);
fprintf('b = %d\n',b_unif_1000_simulated);
c_unif_10000_simulated = (max(x_unif_10000_simulated) - min(x_unif_10000_simulated)) / length(x_unif_10000_simulated);
a_unif_10000_simulated= min(x_unif_10000_simulated) - c_unif_10000_simulated;
b_unif_10000_simulated = max(x_unif_10000_simulated) + c_unif_10000_simulated;
disp('Uniform distribution');
fprintf('a = %d\n',a_unif_10000_simulated);
fprintf('b = %d\n',b_unif_10000_simulated);

param_x_exp_100_simulated=fitdist(x_exp_100_simulated,'Exponential');
disp(param_x_exp_100_simulated);
param_x_exp_1000_simulated=fitdist(x_exp_1000_simulated,'Exponential');
disp(param_x_exp_1000_simulated);
param_x_exp_10000_simulated=fitdist(x_exp_10000_simulated,'Exponential');
disp(param_x_exp_10000_simulated);

