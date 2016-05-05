%
% smiley-epsilon is a set of tools for numerical methods used in engineering applications.
% Written by: Islam Faisal (decltypeme)
% The American University in Cairo
% For License, please see LICENSE 
%

%
% File: plot_f.m
% Author: Islam Faisal
% Script to plot the five test functions
%
x = -10:0.1:10;
cd 'functions';
plot(x, f5(x));
cd '..';
%title('');
xlabel('x');
ylabel('f(x)');
saveas(gcf, 'figures\functions\f5.eps');