function dx = sem_01_func (t, x, sys)

  %system parameters
  F_c = sys.F_c;
  F_r = sys.F_r;
  F_f = sys.F_f;
  m1  = sys.m1;
  m2  = sys.m2;
  m3  = sys.m3;
  g   = sys.g;
  l   = sys.l;
  b2  = sys.b2;
  k2  = sys.k2;

  % =========M(x)==========

  M = eye(4);
  M(2, 4) = - (m2 + 0.5 * m3) * l * cos(x(3)) / (m1 + m2 + m3);
  M(4, 2) = - (m2 + 0.5 * m3) * l * cos(x(3)) / ( (m2 + 0.33 * m3) * l^2 );

  %=======================

  dx = zeros(4 , 1);
  dx(1) = x(2);
  dx(2) = ( F_r - F_f - (m2 + 0.5 * m3) * l * x(4)^2 * sin(x(3)) ) / (m1 + m2 + m3);
  dx(3) = x(4);
  dx(4) = ( (m2 + 0.5 * m3) * g * l * sin(x(3)) - b2 * x(4) - k2 * x(3) ) / ( (m2 + 0.33 * m3) * l^2 );

  dx = M * dx;
endfunction
