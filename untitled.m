
syms t s;
A = 6;
B = 5;
C =11;

f1 = A*t*exp(-B*t);
F1 = laplace(f1);

f2 = A - exp(-2*t)*(sin(t-B) - cos(t-B) + sin(t-C)*cos(t-C));
F2 = laplace(f2);
F2S = simplify(F2);
pretty(F2S);




F3 = (s^3+4*s^2+6*s+5)/((s+8)*(s^2+8*s+3)*(s^2+5*s+7));
f3 = ilaplace(F3);
f3S = simplify(F3IL);
t = [0 50];
fplot(f3S, t);



tspan = 0 : 0.2 : 200;

odefun = @(t, X) [X(2); (A + sin(B*t) - (1/C)*X(2) - 2*X(1)) / 5];

% Zakres czasu
% od 0 do 10 sekund
X0 = [0 1];     % Warunki początkowe [x(0), x'(0)]

% Rozwiązanie równania różniczkowego
[t, X] = ode45(odefun, tspan, X0);

% Wykres rozwiązania
plot(t, X(:,1)), xlabel('t'), ylabel('x(t)'), title('Rozwiązanie równania różniczkowego')

odeL = laplace(odefun);




