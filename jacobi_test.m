%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: jacobi_test.m
% Author: Islam Faisal
% Script to test the Jacobi method
%

load('matrices\linear_eq.mat');
[res, ea_h] = jacobi(coeff, vs, 100, 0.01, 1);
disp('The solution found is');
disp(res);


%When plotting, we skip the first one.
iters = 2:length(ea_h);
plot(iters, ea_h(2:length(ea_h)));
title('Iterations Vs. Relative Approximate Error');
xlabel('iteration');
ylabel('relative approximate error');
saveas(gcf, 'figures\jacobi.eps');