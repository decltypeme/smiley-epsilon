#This file implements the newton raphson method for finding a root for an equation given an initial guess.
#The function assumes both the function and its derivative are given as black-box functions.

########Input
#x:           The initial guess of the root.
#f:           The function as a blackbox. The goal is f(x) = 0
#d:           The first derivative of the function as a blackbox
#es:          The target approximate relative error. Stops if ea <= es
#iter_c:      The iterations budget. Stops if iter > iter_c
#verbose:     Determine whether you want detailed output to be printed.

########Output
#root:        The root that the method terminated at.
#valid:       The method converged. (Needs to be implemented)
#ea:          The approximate relative error at the end of the run.
#iter:        The iteration that the algorithm terminated at.

function [root, ea, iter] = newton_raphson(x, f, delta, es, iter_c, verbose = false)
  #initialize
  iter = 0;
  ea = 100;
  root = x;
  if(verbose)
    printf("Starting Newton-Raphson method with x = %f \n", x);
  endif
  if(feval(@f, x) == 0.0)
    return;
  endif
  while(iter <= iter_c && ea > es)
    iter++;
    new_root = compute_root_nr(root, f, delta);
    ea = compute_ea(new_root, root);
    if(verbose)
      printf("Iteration# %d: root = %f and ea is %f \n", iter, root, ea);
    endif
    root = new_root;
  endwhile
  return;
endfunction


#Function to compute the new root value as part of the new-raphson method
function res = compute_root_nr(x, f, delta)
res = x - (f(x))/(delta(x));
return;
endfunction