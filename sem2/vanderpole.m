function dx = vanderpole(t, x)


  dx = zeros(2 , 1);
  dx(1) = x(2);
  dx(2) = -x(1) + 0.5 * (1 - x(1)^2) * x(2);

endfunction
