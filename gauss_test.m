%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: gauss_test.m
% Author: Islam Faisal
% Script to test the Jacobi method
%

load('matrices\linear_eq.mat');
%Augment it
augmented = [coeff, vs];
[res] = gauss_jordan(augmented);
disp('The solution found is\n');
disp(res);