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

xl = 1;
xu = 2;
x_guess = exp(7/40);
es = 0.01;
iter_limit = 100;
foo = @f5;
file_name = 'f5';
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
x2 = n1:n2;
y2 = sol.false.ea_all(n1:n2);
%Secant Method - Comment if unwanted
n2 = length(sol.secant.ea_all);
x3 = n1:n2;
y3 = sol.secant.ea_all(n1:n2);
%Newton-Raphson Method - Comment if unwanted
n2 = length(sol.newton.ea_all);
x4 = n1:n2;
y4 = sol.newton.ea_all(n1:n2);
%Now, plot
plot(x1,y1,'-rx',x2,y2,'-bo', x3,y3, '-g*', x4, y4, '-ksquare');
legend('Bisection','False Position', 'Secant', 'Newton-Raphson');
title('Iterations Vs. Relative Approximate Error');
xlabel('iteration');
ylabel('relative approximate error');
%saveas(gcf, strcat(relative_to_call_path, file_name , '.eps'));
saveas(gcf,strcat(relative_to_call_path, file_name),'epsc');
%Print results to file
fileID = fopen(strcat(relative_to_call_path, file_name , '.txt'), 'wt');
fprintf(fileID,'Bisection\nroot:\t%f\terror:\t%f\n', sol.bisect.xr, sol.bisect.ea_all(length(sol.bisect.ea_all)));
fprintf(fileID,'False Position\nroot:\t%f\terror:\t%f\n', sol.false.xr, sol.false.ea_all(length(sol.false.ea_all)));
fprintf(fileID,'Secant\nroot:\t%f\terror:\t%f\n', sol.secant.xk, sol.secant.ea_all(length(sol.secant.ea_all)));
fprintf(fileID,'Newton\nroot:\t%f\terror:\t%f\n', sol.newton.root, sol.newton.ea_all(length(sol.newton.ea_all)));
fclose(fileID);