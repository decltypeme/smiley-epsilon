%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: test.m
% Author: Islam Faisal
% Testing of the numerical integration algorithm
%

x = [0 0.05 0.15 0.25 0.35 0.475 0.6];
%x = 0:0.1:0.6;
y = f_test(x);
res = integrate(x, y, 0.000001);
disp(res);