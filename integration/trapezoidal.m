%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: trapezoidal.m
% Author: Islam Faisal
% Compute the estimate of the integral based on the trapezoidal
%


function [ res ] = trapezoidal( h, f0, f1 )
%TRAPEZOIDAL Compute the estimate of the integral based on the trapezoidal
%rule
res = h * (f0 + f1) / 2.0;
return;
end

