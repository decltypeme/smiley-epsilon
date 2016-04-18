%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE
%

%
% File: newton_raphson.m
% Author: Islam Faisal
% The newton Raphson method for root finding
%


%This file implements the newton raphson method for finding a root for an equation given an initial guess.
%The function assumes both the function and its derivative are given as black-box functions.

%%%%%%%Input
%x:           The initial guess of the root.
%f:           The function as a blackbox. The goal is f(x) = 0
%d:           The first derivative of the function as a blackbox
%es:          The target approximate relative error. Stops if ea <= es
%iter_c:      The iterations budget. Stops if iter > iter_c
%verbose:     Determine whether you want detailed output to be printed.

%%%%%%%%Output
%root:        The root that the method terminated at.
%ea:          The approximate relative error at the end of the run.
%iter:        The iteration that the algorithm terminated at.


function [root, ea_all, iter] = newton_raphson(x, f, delta, es, iter_c, verbose)
%initialize
iter = 0;
ea = 100;
root = x;
if(verbose)
    printf('Starting Newton-Raphson method with x = %f \n', x);
end
if(feval(f, x) == 0.0)
    return;
end
while(iter <= iter_c && ea > es)
    iter = iter + 1;
    new_root = compute_root_nr(root, f, delta);
    ea = compute_ea(new_root, root);
    if(verbose)
        printf('Iteration# %d: root = %f and ea is %f \n', iter, root, ea);
    end
    root = new_root;
    ea_all(iter) = ea;
end
return;
end


%Function to compute the new root value as part of the new-raphson method
function res = compute_root_nr(x, f, delta)
res = x - (f(x))/(delta(x));
return;
end