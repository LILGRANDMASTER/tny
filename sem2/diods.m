function dx = diods(t, x)


  dx = zeros(2 , 1);
  dx(1) = 0.5 * (-h(x(1)) + x(2));
  dx(2) = 0.2 * (-x(1) - 1.5 * x(2) + 1.2);

endfunction


function y = h(x)

  y = 17.76 * x - 103.79 * x^2 + 226.31 * x^3 - 226.31 * x^4  + 83.72 * x^5;

endfunction
