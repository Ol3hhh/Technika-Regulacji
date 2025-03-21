clc; clear; close all;
syms y(t) t s;

A = 6;
B = 5;
C = 11;

d2y = diff(y(t), t, t);
dy = diff(y(t), t);

diff_equation = 5*d2y + 1/C*dy + 2*y(t) == A + sin(B*t);

F_lap = laplace(diff_equation, t, s);

F_lap_ini_con_1 = subs(F_lap, y(0), 0);
F_lap_ini_con_2 = subs(F_lap_ini_con_1, dy, 1);

syms Yt;
final_lap = subs(F_lap_ini_con_2, laplace(y(t), t, s), Yt);

sol_in_free_domain = solve(final_lap, Yt);

simplified_sol = partfrac(sol_in_free_domain, s);

[num, den] = numden(sol_in_free_domain);
num_coeffs = sym2poly(num);
den_coeffs = sym2poly(den);

[R, P, K] = residue(num_coeffs, den_coeffs);

disp('Rozkład na ułamki proste przy użyciu residue:');
disp('Reszty R:'), disp(R);
disp('Bieguny P:'), disp(P);
disp('Wielomian K:'), disp(K);

y(t) = ilaplace(simplified_sol, s, t);

pretty(y(t));

fplot(y, [0, 500]);
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');
title('Rozwiązanie y(t)');
