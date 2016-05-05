function [X, ea, iter] = gauss_seidel(A, B, X_i = zeros(length(B), 1), iter_c = 10000, es = eps)
  
  iter = 0;
  ea = 100;
  X = X_i;
  
  %Assert dimensions
  
  while(iter < iter_c && ea > es)
    iter++;
    printf("Iteration # %d\n", iter);
     X_i = X;
      for i = 1:length(B)
        sigma = 0;
        for j = 1:length(B)
          if(i != j)
            sigma += A(i, j) * X(j);
          endif
        endfor
        X(i) = (B(i) - sigma) / A(i, i);
      endfor
    disp("The new solution\n");
    disp(X); 
    if(iter != 1)
      ea = compute_ea_matrix(X_i, X);
    endif   
  endwhile
  return;
endfunction

function max_ea = compute_ea_matrix(X_old, X_new)
  ea = abs(ones(length(X_old), 1) - (X_old ./ X_new));
  disp("Errors are \n");
  disp(ea);
  max_ea = max(ea) * 100;
  return;
endfunction
