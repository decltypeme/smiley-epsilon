%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: solve_plot.m
% Author: Islam Faisal
% Solving a function with all of the methods
%

xl = -2;
xu = 1;
x_guess = 1;
es = 0.01;
iter_limit = 100;
foo = @f1;
file_name = 'f1';
relative_to_call_path = 'figures\roots\';
delta_foo = @delta1;
%Solve using the bisection method
[sol.bisect.xr, sol.bisect.valid, sol.bisect.ea_all, sol.bisect.iter] = bracketing(xl, xu, foo, es, iter_limit, true);
%Solve using the false position method
[sol.false.xr, sol.false.valid, sol.false.ea_all, sol.false.iter] = bracketing(xl, xu, foo, es, iter_limit, false);
%Solve using the secant method
[sol.secant.xk, sol.secant.ea_all, sol.secant.iter] = generic_secant(xl, xu, foo, es, iter_limit, false, 0, true);
%Solve using the Newton-Raphson method
[sol.newton.root, sol.newton.ea_all, sol.newton.iter] = newton_raphson(x_guess, foo, delta_foo, es, iter_limit, false);
%Make data ready to plot
n1 = 2;
%Bisection - Comment if uwanted
n2 = length(sol.bisect.ea_all);
x1 = n1:n2;
y1 = sol.bisect.ea_all(n1:n2);
%False position - Comment if unwanted 
n2 = length(sol.false.ea_all);
x1 = n1:n2;
y1 = sol.false.ea_all(n1:n2);
%Secant Method - Comment if unwanted
n2 = length(sol.secant.ea_all);
x1 = n1:n2;
y1 = sol.secant.ea_all(n1:n2);
%Newton-Raphson Method - Comment if unwanted
n2 = length(sol.newton.ea_all);
x1 = n1:n2;
y1 = sol.newton.ea_all(n1:n2);
%Now, plot
plot(x1,y1,'-ro',x2,y2,'-bo', x3,y3, '-go', x4, y4, '-ko');
legend('Bisection','False Position', 'Secant', 'Newton-Raphson');
title('Iterations Vs. Relative Approximate Error');
xlabel('iteration');
ylabel('relative approximate error');
saveas(gcf, strcat(relative_to_call_path, file_name , '.eps'));