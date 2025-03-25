syms y(t) s t;
A = 6;
B = 5;
C =11;

tspan = 0 : 0.1 : 500;

odefun = @(t, X) [X(2); (A + sin(B*t) - (1/C)*X(2) - 2*X(1)) / 5];


An = 3/11 - cos(5*t) - sin(1351*t)/1351 - 0.182*exp(-t/110)*cos(0.64*t)+0.29*exp(-t/110)*sin(0.64*t);





X0 = [0 0];    

[t, X] = ode45(odefun, tspan, X0);



plot(t, X(:,1))
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');

fplot(An, [0, 500]);
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');


