syms y(t) t s;
A = 6;
B = 5;
C =11;

d2y = diff(y(t), t, t);
dy = diff(y(t), t);

diff_equation = 5*d2y + 1/C*dy + 2 y(t) == A + sin(B*t);

F_lap = laplace(diff_equation, t, s);

F_lap_ini_con_1 = subs(F_lap, y(0), 0);
F_lap_ini_con_2 = subs(F_lap_ini_con_1, dy, 1);

syms Yt;

final_lap = subs(F_lap_ini_con_2, laplace(y(t), t, s), Yt);
sol_in_free_domain = solve(final_lap, Yt);

y(t) = ilaplace(sol_in_free_domain, s, t);

fplot(y, [0, 3]);