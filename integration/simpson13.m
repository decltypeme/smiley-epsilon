%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: simpson13.m
% Author: Islam Faisal
% Compute the estimate of the integral based on the simpson's 1/3 rule
%


function [ res ] = simpson13( h, f0, f1, f2 )
%simpson13 Compute the estimate of the integral based on the simpson's 1/3 rule
res = 2.0 * h * (f0 + 4 * f1 + f2) / 6.0;
return;
end

