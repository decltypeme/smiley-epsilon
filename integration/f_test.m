%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: f_test.m
% Author: Islam Faisal
% Testing Function for the numerical integration algorithm
%

function [ y ] = f_test( x)
y = 2 .* exp(-1.5 .* x);
return;
end