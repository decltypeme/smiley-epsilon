%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE
%

%
% File: compute_ea.m
% Author: Islam Faisal
% Computing approximate relative error
%

function ea = compute_ea(xnew, xold)
percentage = true;
%Avoid division by zero
if(xnew == 0.0)
    xnew = eps;
end
%Compute the approximation error
ea = abs(1 - xold/xnew);
%Return percentage if required
if(percentage)
    ea = ea * 100.0;
end
return;
end