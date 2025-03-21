syms s;

F3 = (s^3+4*s^2+6*s+5)/((s+8)*(s^2+8*s+3)*(s^2+5*s+7));
f3 = ilaplace(F3);
f3S = simplify(f3);
pretty(f3S);
t = [0 50];
fplot(f3S, t);
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');

