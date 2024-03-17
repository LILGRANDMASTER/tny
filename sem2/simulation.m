pendulum_x0 = [10, 6, 3.5, -0.2, -1.6, -8, -8, -4.5, -3.5, 0.5;
      -8, -8, -8, -8, -8, 7.1, 8.9, 10, 10, 10]

vanderpole_x0 = [4, -4, 0.1, -4, 4;
      4, 4, 0.1, -4, -4]

diods_x0 = [-0.4, -0.4, -0.4, -0.4, 1.6, 0.8, 0.78, 0.7, 1.6;
      0.2, 1, 1.25, 1.58, 0.8, -0.4, -0.4, -0.4, -0.3]

t = -5 : 0.01 : 10;


#=======================Для маятника==============================

[T, X] = sem_ode(@pendulum, t, pendulum_x0(:, 1));

#Графики для первой точки начальных условий
figure(1)

  subplot(3, 1, 1);
  plot(T, X(1, :));
  xlabel('t, время');
  ylabel('x1, координата');

  subplot(3, 1, 2);
  plot(T, X(2, :));
  xlabel('t, время');
  ylabel('x2, координата');

  subplot(3, 1, 3);
  plot(X(1, :), X(2, :));
  xlabel('x1');
  ylabel('x2');


#Фазовый портрет для всех точек начальных условий
figure(2)

  hold on;
  for i = 1 : length(pendulum_x0)
      [T, X] = sem_ode(@pendulum, t, pendulum_x0(:, i));
      plot(X(1, :), X(2, :));
      xlabel('x1');
      ylabel('x2');

  endfor
  hold off;

#=============================================================



#=======================Осциллятор Ван Дер Поля==============================

[T, X] = sem_ode(@vanderpole, t, vanderpole_x0(:, 1));

#Графики для первой точки начальных условий
figure(3)

  subplot(3, 1, 1);
  plot(T, X(1, :));
  xlabel('t, время');
  ylabel('x1, координата');

  subplot(3, 1, 2);
  plot(T, X(2, :));
  xlabel('t, время');
  ylabel('x2, координата');

  subplot(3, 1, 3);
  plot(X(1, :), X(2, :));
  xlabel('x1');
  ylabel('x2');


#Фазовый портрет для всех точек начальных условий
figure(4)

  hold on;
  for i = 1 : length(vanderpole_x0)
      [T, X] = sem_ode(@vanderpole, t, vanderpole_x0(:, i));
      plot(X(1, :), X(2, :));
      xlabel('x1');
      ylabel('x2');

  endfor
  hold off;

#=============================================================


#=======================Туннельные Диоды==============================

[T, X] = sem_ode(@diods, t, diods_x0(:, 1));

#Графики для первой точки начальных условий
figure(5)

  subplot(3, 1, 1);
  plot(T, X(1, :));
  xlabel('t, время');
  ylabel('x1, координата');

  subplot(3, 1, 2);
  plot(T, X(2, :));
  xlabel('t, время');
  ylabel('x2, координата');

  subplot(3, 1, 3);
  plot(X(1, :), X(2, :));
  xlabel('x1');
  ylabel('x2');


#Фазовый портрет для всех точек начальных условий
figure(6)

  hold on;
  for i = 1 : length(diods_x0)
      [T, X] = sem_ode(@diods, t, diods_x0(:, i));
      plot(X(1, :), X(2, :));
      xlabel('x1');
      ylabel('x2');

  endfor
  hold off;

#=============================================================
