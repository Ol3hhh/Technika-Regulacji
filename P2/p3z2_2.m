% === Transmitancja obiektu ===
C = 11;
s = tf('s');
G = C / ((s + 2)*(s + 3)*(s - 1));  % obiekt niestabilny

% === Parametry regulatora PI ===
Kp = 0.7143;
Ki = 0.0082;

% === Regulator PI ===
C_pi = Kp + Ki/s;  
% === Układ zamknięty ===
sys_cl = feedback(C_pi * G, 1);  % pętla sprzężenia zwrotnego

% === Odpowiedź na skok jednostkowy ===
step(sys_cl);
title(['Odpowiedź układu z regulatorem PI (K_p = ' num2str(Kp) ', K_i = ' num2str(Ki) ')']);
xlabel('Czas [s]');
ylabel('Wyjście');
grid on;
