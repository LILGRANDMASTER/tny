x0 = [0; 0; 0; 0.1]; % начальные условия
t = 0 : 0.01 : 10;

% Параметры системы
  sys.P   = 0;
  sys.I   = 0;
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

[T, X]  = sem_ode(@sem_01_func, t, x0, sys);   % П-регулятор
[T, X2] = sem_ode(@sem_01_func2, t, x0, sys);  % без регулирования
[T, X3] = sem_ode2(@sem_01_func, t, x0, sys);  % ПИ-регулятор

X(3, :) = X(3, :) * 180/pi; % переводим радианы в градусы
X(4, :) = X(4, :) * 180/pi;

X2(3, :) = X2(3, :) * 180/pi; % переводим радианы в градусы
X2(4, :) = X2(4, :) * 180/pi;

X3(3, :) = X3(3, :) * 180/pi; % переводим радианы в градусы
X3(4, :) = X3(4, :) * 180/pi;

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


figure(3);

  subplot(2, 1, 1);
  % Выводим координату и скорость
    ax = plotyy(T, X3(1, :), T, X3(2, :));
    ylabel(ax(1), 'x, м');
    ylabel(ax(2), 'v, м/с');


  subplot(2, 1, 2)
  % Выводим угол и угловую скорость
    ax = plotyy(T, X3(3, :), T, X3(4, :));
    ylabel(ax(1), 'fi, град.');
    ylabel(ax(2), 'w, град/c');


