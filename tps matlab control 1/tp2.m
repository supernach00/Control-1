%tp2, 
%% Ejercicio 1
clear
clc
s = tf('s');

Ga = (6)*(s+1)/((s+2)*(s+3));
Gb = (4)/((s+2)*(s+2));
H = 1;

[y,t] = step(Gb*H);

Gaa = @(t) 1 + 3*exp(-2*t) - 4*exp(-3*t); %testeando las repsuestas
Gbb = @(t) 1 - 2.*t.*exp(-2*t) - exp(-2*t);

figure
subplot(1,2,1);
plot(t,y);
subplot(1,2,2);
plot(t, Gbb(t));

%% Ejercicio 2
clear
clc
s = tf('s');

wn = 2.834;
eps = 0.6901; % valores calculados

G = (wn*wn)/(s*s + 2*eps*wn*s + wn*wn);

[y,t] = step(G);

% Encontrar el valor máximo (sobrepico) y su índice
[max_y, idx] = max(y);
max_t = t(idx);

% Graficar la respuesta escalón
plot(t,y);
hold on;

% Marcar el sobrepico en el gráfico
plot(max_t, max_y, 'ro', 'MarkerSize', 8, 'DisplayName', sprintf('Sobrepico: %.2f', max_y));

% Añadir leyenda y etiquetas
legend('Respuesta escalón', 'Sobrepico');
xlabel('Tiempo (s)');
ylabel('Salida');
title('Respuesta escalón con marcado del sobrepico');

hold off;

%% Ejercicio 3
clear
clc
s = tf('s');

% Valor fijo de b
b = 5;

% Diferentes valores de a
a_values = [6, 10, 20, 40]; % Ejemplo de valores para a

% Crear una figura para el gráfico
figure;
hold on;

% Trazar las respuestas escalón para cada valor de a
for i = 1:length(a_values)
    a = a_values(i);
    G = (s + a) / (s * (s + b));
    GLC = (G)/(1+G);
    
    % Calcular la respuesta al escalón
    [y,t] = step(GLC);
    
    % Graficar
    plot(t, y, 'DisplayName', sprintf('a = %.1f', a));
end

% Añadir etiquetas, título y leyenda
xlabel('Tiempo (s)');
ylabel('Salida');
title('Respuesta al escalón para diferentes valores de a');
legend show;
grid on;

hold off;

%% Ejercicio 4
clear
clc
s = tf('s');

a = 0.0652;
T = 1/a %valor de establecimiento

G = (1)/(s+a);

[y,t] = step(G);
plot(t,y);

%% Ejercicio 5
clear
clc
s = tf('s');

tau = 1;
K = 12.46;
Kh = 0.178;

G = (K)/(s+1);
G1 = G/(1+G*Kh);
G2 = (G1*(1/s))/(G1*(1/s) + 1)
[y,t] = step(G2);
plot(t,y);
plot(t,y);

%% 
s = tf('s');
G = 15/((s*s)*(1)*(0.2*s+1));
H = (s+4)/(1);
T = G/(1+G*H);
% rlocus(G*H);
[y,t] = step(T);
% plot(t,y);