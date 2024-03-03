function [T, X] = sem_ode(f, t, x0, sys)

  T = t;
  X = zeros(length(x0), length(T));
  X(: , 1) = x0;

  mid = zeros(length(x0), 1);

  % Расчет управляющего воздействия П-регулятор по скорости и угловой скорости И-регулятор по углу
  sys.P   = 10 * (0 - X(2, 1)) + 7 * (0 - X(4, 2));
  sys.I   = 13 * (0 - X(3, 1));
  sys.F_c = sys.P + sys.I;

  for i = 1 : length(T) - 1
    % Метод Рунге-Кутта
    dt = T(i + 1) - T(i);
    v1 = f(T(i), X(: , i), sys);

    mid = X(: , i) + dt/2 * v1;
    v2  = f(T(i) + dt/2, mid, sys);

    mid = X(: , i) + dt/2 * v2;
    v3  = f(T(i) + dt/2, mid, sys);

    mid = X(: , i) + dt * v3;
    v4  = f(T(i) + dt, mid, sys);

    X(:, i+1) = X(: , i) + dt/6 * (v1 + 2*v2 + 2*v3 + v4);

    % Расчет управляющего воздействия П-регулятор по скорости и угловой скорости И-регулятор по углу
    sys.P   = 10 * (0 - X(2, i+1)) + 7 * (0 - X(4, i+1));
    sys.I   = sys.I + 13 * (0 - X(3, i+1));

    sys.F_c = sys.P + sys.I;

  endfor

endfunction
