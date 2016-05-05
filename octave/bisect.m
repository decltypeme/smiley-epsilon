#This mini-tool implements the bisection method for finding roots of non-linear equations.
#The bisection method is a bracketing method that given an estimate interval that contain a root, finds an approximation for a root

function [xr, valid, ea, iter] = bisect(xl, xu, func, es, imax)
  #Just some initiliazations
  #Iterations are 1-indexed
  iter = 0;
  valid = true;
  ea = 100.0;
  test = test_product_positive(xl, xu, func);
  xr = 0; #NEED TO BE REVIEWED
  #Just verifying there is a change of sign at the initial guesses
  if(test == 1)
    valid = false;
    return;
   endif
  while(ea >= es && iter < imax)
    iter+=1;
    xr_previous = xr;
    xr = (xl + xu) / 2.0;
    if(iter != 1)
      if (xr != 0)
        ea = abs((xr - xr_previous) / xr) * 100;
      else
        #Need to be reviewed
        ea = abs((xr_previous) / eps) * 100;
      endif
    endif
    test = test_product_positive(xl, xr, func);
    if(test == 1)
      xl = xr;
    elseif(test == -1)
      xu = xr;
    elseif(test == 0)
      ea = 0;
    endif
  endwhile
  return;
endfunction

function result = test_product_positive(xl, xu, func)
  f_xl = feval(func, xl);
  f_xu = feval(func, xu);
  
  if((f_xu * f_xl) > 0)
    result = 1;
  elseif((f_xu * f_xl) < 0)
    result = -1;
  else
    result = 0;
  endif
  return;
endfunction