function ea = compute_ea(xnew, xold, percentage = true)
  #Avoid division by zero
  if(xnew == 0.0)
    xnew = eps;
  endif
  #Compute the approximation error
  ea = abs(1 - xold/xnew);
  #Return percentage if required
  if(percentage)
    ea *= 100.0;
  endif
  return;
endfunction