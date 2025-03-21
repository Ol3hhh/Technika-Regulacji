tspan = 0 : 0.1 : 500;

odefun = @(t, X) [X(2); (A + sin(B*t) - (1/C)*X(2) - 2*X(1)) / 5];


X0 = [-10 -10];    

[t, X] = ode45(odefun, tspan, X0);

plot(t, X(:,1))
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');