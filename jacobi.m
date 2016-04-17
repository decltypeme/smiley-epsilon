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

function [ x, ea_hist ] = jacobi( a, b, imax, es, lambda)
%Dimensions Checking
dims = size(a);
if(dims(1) ~= dims(2))
    disp('Invalid argument: Matrix must be square');
    return;    
else
    n = dims(1);
end
dims = size(b);
if(dims(1) ~= n)
    disp('Invalid argument: Inconsistent Dimensions for the given system');
    return;    
elseif(dims(2) ~= 1)
    disp('Invlaid argumetn: the b matrix must be a column vector');
    return
end
%Allocation for x
x = zeros(n, 1);
%Divide by diagonal elements
for i = 1 : n
	temp = a(i, i);
    for j = 1 : n
        a(i, j) = a(i, j) / temp;
    end
	b(i) = b(i) / temp;
end
for i = 1 : n
    sum = b(i);
    for j = 1 : n
        if(i ~= j)
			sum = sum - a(i,j) * x(j);
        end
    end
	x(i) = sum;
end
%Jacobi Iteration: Main algorithm
iter = 1;
sentinel = 0;

while(sentinel == 0 && iter <= imax)
    ea_hist(iter) = 0;
    sentinel = 1;
    xnew = zeros(n, 1);
      for i = 1 : n
      	old = x(i);
      	sum = b(i);
      	for j = 1 : n
            if( i ~= j)
                sum = sum - a(i, j) * x(j);
            end
        end
      	xnew(i) = lambda * sum + (1-lambda)*old;
      	if(sentinel == 1 && xnew(i) ~= 0)
      		ea = abs((xnew(i) - old) / xnew(i))*100;
            ea_hist(iter) = max(ea, ea_hist(iter));
            if(ea > es)
                sentinel = 0;
            end
        end
      end
      x = xnew;
      iter = iter + 1;
end

end

