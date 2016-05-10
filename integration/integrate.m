%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE
%

%
% File: integrate.m
% Author: Islam Faisal
% Compute the estimate of the integral based on a combination of the three
% rules
%


function [ res ] = integrate( x, f, tol )
if(length(x) ~= length(f))
    disp('Mismatched dimensions');
    return;
end
n = length(x);
h = x(2) - x(1);
k = 0;
sum = 0;
for j = 1 : n+1
    if(j < n)           %Check if there are still more xs
        hf = x(j+1) - x(j);
    end
    if(abs(h - hf) < tol)
        if(k==3)
            sum = sum + simpson13(h, f(j-3), f(j-2), f(j-1));
            k = k-1;
        else
            k = k+1;
        end
    else
        if(k == 1)
            sum = sum + trapezoidal(h, f(j-1), f(j));
        else
            if(k==2)
                sum = sum + simpson13(h, f(j-2), f(j-1), f(j));
            else
                sum = sum + simpson38(h, f(j-3), f(j-2), f(j-1), f(j));
            end
            k = 1;
        end
    end
    h = hf;
end
res = sum;
return;
end

