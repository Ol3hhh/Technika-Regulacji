% === Transmitancja obiektu ===
C = 11;
s = tf('s');
G = C / ((s + 2)*(s + 3)*(s - 1));  % obiekt z biegunem dodatnim

% === Regulator P ===
Kp = 3;
C_p = Kp; 

% === Układ zamknięty (gotowa funkcja) ===
sys_cl = feedback(C_p * G, 1);  % gotowa funkcja do zamykania pętli

% === Symulacja odpowiedzi na skok jednostkowy ===
step(sys_cl);
title(['Odpowiedź skokowa układu P dla K_p = ' num2str(Kp)]);
grid on;
