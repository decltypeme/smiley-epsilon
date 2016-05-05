%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%
%
% File: bracketing.m
% Author: Islam Faisal
% The Bracketing methods: Bisection and false position
%
%This mini-tool implements the bisection method for finding roots of non-linear equations.
%The bisection method is a bracketing method that given an estimate interval that contain a root, finds an approximation for a root
function [xr, valid, ea_all, iter] = bracketing(xl, xu, func, es, imax, isBisection)
%Just some initiliazations
%Iterations are 1-indexed
iter = 0;
valid = true;
ea = 100.0;
ea_all(1) = ea;
test = test_product_positive(xl, xu, func);
xr = 0; %NEED TO BE REVIEWED
%Just verifying there is a change of sign at the initial guesses
if(test == 1)
    valid = false;
    return;
end
while(ea >= es && iter < imax)
    iter = iter + 1;
    xr_previous = xr;
    if(isBisection)
        xr = bisectionCompute(xl, xu);
    else
        xr = falsePositionCompute(xl, xu, func);
    end
    if(iter ~= 1)
        if (xr ~= 0)
            ea = abs((xr - xr_previous) / xr) * 100;
        else
            %Avoid division by zero
            ea = abs((xr_previous) / eps) * 100;
        end
    end
    test = test_product_positive(xl, xr, func);
    if(test == 1)
        xl = xr;
    elseif(test == -1)
        xu = xr;
    elseif(test == 0)
        ea = 0;
    end
    ea_all(iter) = ea;
end
return;
end

function result = test_product_positive(xl, xu, func)
f_xl = feval(func, xl);
f_xu = feval(func, xu);

if((f_xu * f_xl) > 0)
    result = 1;
elseif((f_xu * f_xl) < 0)
    result = -1;
else
    result = 0;
end
return;
end

function xr = bisectionCompute(xl, xu)
xr = (xl + xu) / 2.0;
return;
end

function xr = falsePositionCompute(xl,xu, f)
xr = xu - ((f(xu) * (xl - xu))) / (f(xl)  - f(xu));
end