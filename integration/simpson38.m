%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: simpson38.m
% Author: Islam Faisal
% Compute the estimate of the integral based on the simpson's 3/8 rule
%


function [ res ] = simpson38( h, f0, f1, f2, f3 )
%simpson13 Compute the estimate of the integral based on the simpson's 3/8 rule
res = 3.0 * h * (f0 + 3 * (f1 + f2) + f3) / 8.0;
return;
end

