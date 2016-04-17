#This file implements a generic (except for Newton-Raphson) open method for finding a root for an equation given an initial guess.
#The function assumes both the function and its derivative are given as black-box functions.
#Newton-Raphson is implemented in newton_raphson.m


########Input
#x:           The initial guess of the root.
#f:           The function as a blackbox. The goal is f(x) = 0
#es:          The target approximate relative error. Stops if ea <= es
#iter_c:      The iterations budget. Stops if iter > iter_c
#verbose:     Determine whether you want detailed output to be printed.
#delta:       Extra parameter for some methods such as the modified secant.

########Output
#root:        The root that the method terminated at.
#ea:          The approximate relative error at the end of the run.
#iter:        The iteration that the algorithm terminated at.

function [xk, ea, iter] = open_method(xi, xj, f, es, iter_c, modified_secant, delta = 0.01, verbose = false)
  #initialize
  iter = 0;
  ea = 100;
  xk = xj;
  if(verbose)
    printf("Starting the open method with x = %f \n", xj);
  endif
  if(feval(@f, xj) == 0.0)
    return;
  endif
  while(iter < iter_c && ea > es)     #Should we check if xk == 0.0?
    iter++;
    if(modified_secant)
      xk = modifiedSecant(xj, f, delta);
    else
      xk = secant(xi, xj, f);
    endif
    ea = compute_ea(xk, xj);
    if(verbose)
      printf("Iteration# %d: root = %f and ea is %f \n", iter, xk, ea);
    endif
    xi = xj;
    xj = xk;
  endwhile
  return;
endfunction


#Secant Method
function xk = secant(xi, xj, f)
xk = xj - (f(xj) * (xi - xj))/(f(xi) - f(xj));
return;
endfunction

#Modified Secant Method
function xk = modifiedSecant(xj, f, delta)
xk = xj - (delta * xj * f(xj)) / (f(xj + delta * xj) - f(xj));
return;
endfunction