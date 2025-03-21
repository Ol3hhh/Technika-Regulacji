syms t s;
A = 6;
B = 5;
C =11;

f1 = A*t*exp(-B*t);
F1 = laplace(f1);
F1S = simplify(F1);
pretty(F1S);

f2 = A - exp(-2*t)*(sin(t-B) - cos(t-B) + sin(t-C)*cos(t-C));
F2 = laplace(f2);
F2S = simplify(F2);
pretty(F2S);

plot(out.simout.time, out.simout.signals.values);
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');
title('Wykres sygnału z bloku Scope');
