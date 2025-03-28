syms y(t) s t;
A = 6;
B = 5;
C =11;

tspan = 0 : 0.1 : 500;

odefun = @(t, X) [X(2); (A + sin(B*t) - (1/C)*X(2) - 2*X(1)) / 5];


An = 3/11 - 2.73*10^(-6)*cos(5*t) - 0.00074*sin(5*t) - 0.0292636*exp(-t/22)*(sqrt(967)*cos(sqrt(967)/22*t)-0.36*sin(sqrt(967)/22*t));





X0 = [1 2];    

[t, X] = ode45(odefun, tspan, X0);



plot(t, X(:,1), 'b', 'DisplayName', 'Rozwiązanie numeryczne'); % Pierwszy wykres na niebiesko
hold on;
fplot(An, [0, 500], 'r', 'DisplayName', 'Rozwiązanie analityczne'); % Drugi wykres na czerwono
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');
legend;




