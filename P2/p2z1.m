% Parametry układu
A = 6;
B = 5;
s = tf('s');
G = A / (B*s + 1);

% Pulsacje do testowania
omega_vec = [0.01, 0.1, 0.5, 1, 2, 5];
t = 0:0.01:100; % czas symulacji

% Wykres Nyquista z punktu a)
figure;
nyquist(G); hold on;
title('Charakterystyka Nyquista + punkty z metody ręcznej');
grid on;

for omega = omega_vec
    % Sygnał wejściowy
    u = sin(omega * t);

    % Symulacja odpowiedzi układu
    y = lsim(G, u, t);

    % Usunięcie stanu przejściowego (pierwsze 60 sekund)
    t_ss = t(t > 60);
    u_ss = u(t > 60);
    y_ss = y(t > 60);
    % Dopasowanie sinusoidy: y = A*sin(wt + phi)
    fit_func = @(b, x) b(1) * sin(omega .* x + b(2));
    err_func = @(b) sum((fit_func(b, t_ss(:)) - y_ss(:)).^2);
    b0 = [1, 0]; % początkowe zgadywanie
    params = fminsearch(err_func, b0);


    A_out = params(1);
    phi = params(2);


    % Punkt Nyquista: A_out * exp(j*phi)
    nyq_point = A_out * exp(1j * phi);
    plot(real(nyq_point), imag(nyq_point), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

    % Dla podglądu – opcjonalnie wyświetl amplitudę i fazę:
    fprintf('omega = %.2f rad/s: Amplituda = %.2f, Faza = %.2f deg\n', ...
            omega, A_out, rad2deg(phi));
end

figure;
hold on;
title('Sygnały wyjściowe y(t) dla różnych pulsacji');
xlabel('Czas [s]');
ylabel('Wyjście y(t)');
grid on;

colors = lines(length(omega_vec));  % automatyczne kolory

for i = 1:length(omega_vec)
    omega = omega_vec(i);
    
    % Sygnał wejściowy
    u = sin(omega * t);
    
    % Symulacja odpowiedzi układu
    y = lsim(G, u, t);
    
    % Rysowanie na jednym wykresie
    plot(t, y, 'Color', colors(i,:), 'DisplayName', sprintf('\\omega = %.2f', omega));
end

legend show;