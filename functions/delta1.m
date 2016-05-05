%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: delta1.m
% Author: Islam Faisal
% Function Derivative #1 used in testing
%
function [ y ] = delta1( x )
%y = x.^3 - 8 .* (x.^2) + 12 .* x - 4;
y = 3 .* x.^2 - 16 .* x + 12;
return;
end

