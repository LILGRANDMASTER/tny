x0 = [0; 0; pi/6; 0.1]; % начальные условия
t = 0 : 0.01 : 10;

% Параметры системы
  sys.F_c = 0;
  sys.F_r = 0;
  sys.F_f = 0;
  sys.m1  = 3;
  sys.m2  = 0.2;
  sys.m3  = 0.1;
  sys.g   = 9.8;
  sys.l   = 0.3;
  sys.b2  = 0.25;
  sys.k2  = 0.25;

[T, X]  = sem_ode(@sem_01_func, t, x0, sys);
[T, X2] = sem_ode(@sem_01_func2, t, x0, sys);

X(3, :) = X(3, :) * 180/pi; % переводим радианы в градусы
X(4, :) = X(4, :) * 180/pi;

figure(1);

  subplot(2, 1, 1);
  % Выводим координату и скорость
    ax = plotyy(T, X(1, :), T, X(2, :));
    ylabel(ax(1), 'x, м');
    ylabel(ax(2), 'v, м/с');


  subplot(2, 1, 2)
  % Выводим угол и угловую скорость
    ax = plotyy(T, X(3, :), T, X(4, :));
    ylabel(ax(1), 'fi, град.');
    ylabel(ax(2), 'w, град/c');


figure(2);

  subplot(2, 1, 1);
  % Выводим координату и скорость
    ax = plotyy(T, X2(1, :), T, X2(2, :));
    ylabel(ax(1), 'x, м');
    ylabel(ax(2), 'v, м/с');


  subplot(2, 1, 2)
  % Выводим угол и угловую скорость
    ax = plotyy(T, X2(3, :), T, X2(4, :));
    ylabel(ax(1), 'fi, град.');
    ylabel(ax(2), 'w, град/c');


