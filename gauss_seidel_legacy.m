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

%THIS FILE IS DEPRECATED. PLEASE DO NOT USE.

function [X, ea, iter] = gauss_seidel_legacy(A, B, X_i, iter_c, es)

iter = 0;
ea = 100;
X = X_i;

%Assert dimensions

while(iter < iter_c && ea > es)
    iter = iter + 1;
    printf('Iteration # %d\n', iter);
    X_i = X;
    for i = 1:length(B)
        sigma = 0;
        for j = 1:length(B)
            if(i ~= j)
                sigma = sigma + A(i, j) * X(j);
            end
        end
        X(i) = (B(i) - sigma) / A(i, i);
    end
    disp('The new solution\n');
    disp(X);
    if(iter ~= 1)
        ea = compute_ea_matrix(X_i, X);
    end
end
return;
end

function max_ea = compute_ea_matrix(X_old, X_new)
ea = abs(ones(length(X_old), 1) - (X_old ./ X_new));
disp('Errors are \n');
disp(ea);
max_ea = max(ea) * 100;
return;
end
