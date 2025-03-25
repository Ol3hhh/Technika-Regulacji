syms t;
An = 3/11 - cos(5*t) - sin(1351*t)/1351 - 0.182*exp(-t/110)*cos(0.64*t)+0.29*exp(-t/110)*sin(0.64*t);
fplot(An, [0, 500]);
grid on;
xlabel('Czas [s]');
ylabel('Wartość sygnału');