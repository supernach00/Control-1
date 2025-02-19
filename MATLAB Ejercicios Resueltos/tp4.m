% tp4, estabilidad, bode y nyquist
%% Ejercicio 1
clc
clear
s = tf('s');

GH_a = (1 - 3 * s) / (10 * s) * (1 / (1 + 1.5 * s));
GH_b = 4.7 / ((s + 5) * (s + 583) * (s + 166)); %parece que lo grafica mal pero no, esta todo como comprimido en una linea vertical.

nyquist(GH_b) 

%% Ejercicio 2
clc;
clear;
s = tf('s');

% Sistema sin ganancia
GH_base = (4/5) / (s * (s + 4) * (s + 2));

% Ganancias de prueba
K_values = [10, 30, 60,100]; 

% graficacion
figure;

% Subplot 1: Diagrama de Nyquist
subplot(1,3,1);
hold on;
for K = K_values
    GH = K * GH_base;
    nyquist(GH);
end
hold off;

legend(arrayfun(@(K) sprintf('K = %d', K), K_values, 'UniformOutput', false));
title('Diagrama de Nyquist para diferentes valores de K');

% Subplot 2: Lugar de las raíces (Root Locus)
subplot(1,3,2);
rlocus(GH_base);
hold on;
for K = K_values
    [r,k] = rlocus(GH_base, K);
    plot(real(r), imag(r), 'ro', 'MarkerSize', 8, 'DisplayName', sprintf('K = %d', K));
end
hold off;
title('Lugar de las raíces (Root Locus)');


% Subplot 3: Diagrama de Bode
subplot(1,3,3);
[mag, phase, w] = bode(GH_base);
hold on;
for K = K_values
    GH = K * GH_base;
    [magK, phaseK] = bode(GH, w);
    % Encontrar el margen de ganancia y de fase
    [Gm, Pm, Wcg, Wcp] = margin(GH);
    
    % Graficar las respuestas
    plot(w, 20*log10(squeeze(magK)), 'DisplayName', sprintf('K = %d', K));
    plot(Wcg, 20*log10(squeeze(bode(GH_base, Wcg)) * K), 'ro', 'MarkerSize', 8, 'DisplayName', sprintf('Gm = %0.2f dB', 20*log10(Gm)));
end
bode(GH_base);
hold off;
title('Diagrama de Bode');
legend('show'); 
grid on;

%% Ejercicio 3
clc;
clear;
s = tf('s');

% Definir la función de transferencia
GH_a = 10 / (s * (1 + 0.25 * s) * (1 + 0.006 * s));
GH_b =  (5 / (s * (1 + 100 * s) * (s+1))) * ((10*s + 1)/(0.5*s + 1))
GH_c =  1 / (0.1*s*s + 0.7*s + 1);
GH_d =  (0.1*s*s + 10*s + 1) / (s * (100 + s) * (s + 200)) ;
GH_e =  (5 / (s * (1 + 100 * s) * (s+1))) * (10*s + 1)/(0.5*s + 1);
GH_f =  (s - 2) / (s + 2);

%Definir aca la GH que se quiere ver:

GH = GH_c;

% grafico
figure;

% Subplot 1: Diagrama de Nyquist
subplot(3,1,1);
nyquist(GH); 
title('Diagrama de Nyquist');

% Subplot 2: Diagrama de Bode
subplot(3,1,2);
bode(GH);
title('Diagrama de Bode');
grid on;

subplot(3,1,3);
[y,t] = step(GH/(1+GH));
plot(t,y);
