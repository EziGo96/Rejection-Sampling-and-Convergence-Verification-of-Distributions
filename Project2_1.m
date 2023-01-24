clc;clear;close all;

rng(47)
Cov_U = [11/144 -1/96;-1/96 73/960]
A = chol(Cov_U);

n = 1000;
d = 2;
X = randn(n,d);
X_s = X*A;
Cov_X_s = cov(X_s)
