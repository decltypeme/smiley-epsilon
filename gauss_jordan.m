%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE
%

%
% File: jacobi.m
% Author: Islam Faisal
% Gauss-Seidel with Jacobi iteration and relaxation
%

function [ sol ] = gauss_jordan(A)
s = size(A);
if(s(1) ~= s(2) - 1)
    disp('error\n');
end
n = s(1);
for k = 1 : n
    for l = k+1 : n+1
        A(k, l) = A(k, l) / A(k, k);
    end
    A(k, k) = 1;
    for i = 1 : n
        if i ~=  k
            for j = k+1 : n+1
                A(i, j) = A(i, j) - (A(k, j) * A(i, k));
            end
        end
    end
end
for m=1 : n
    sol(m) = A(m, n+1);
end
return;
end

