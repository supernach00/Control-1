% Control TP1
% Para correr individualmente cada sección, 
% clickear sobre la sección y apretal Ctrl+Enter.
%% Ejercicio 1
clc
clear
% Definición de la variable 's' en el dominio de Laplace
s = tf('s');
G_a = 6*(s+1)/((s+2)*(s+3)) 
G_b = 4/(s*(s+2)*(s+2))

[y1,t1] = step(G_a);
[y2,t2] = step(G_b);

% grafiqueishon
figure
subplot(1,2,1)
plot(t1,y1)
subplot(1,2,2)
plot(t2,y2)

%% Ejercicio 2 
clc
clear

s = tf('s');
wn = -1;

%coeficientes de amortiguamiento
Esub = 0.2; % E < 1
Eam = 1; % E = 1 
Esob = 13; % E > 1

Tsub = (wn^2)/(s^2 + 2*Esub*wn*s + wn^2); %subamortiguado
Tam = (wn^2)/(s^2 + 2*Eam*wn*s + wn^2); %amortiguado
Tsob = (wn^2)/(s^2 + 2*Esob*wn*s + wn^2); %sobreamortiguado

[y1,t1] = step(Tsub);
[y2,t2] = step(Tam);
[y3,t3] = step(Tsob);

% grafiqueishon
figure
subplot(1,3,1)
plot(t1,y1)
title(['Subamortiguado E = ' num2str(Esub)])

subplot(1,3,2)
plot(t2, y2)
title(['Amortiguado Crítico E = ' num2str(Eam)])

subplot(1,3,3)
plot(t3, y3)
title(['Sobreamortiguado E = ' num2str(Esob)])

%% Ejercicio 3
clc
clear
s = tf('s');

% Rango de valores para a
a_valores = 11:1:19;
b = 3;

figure
hold on

for a = a_valores
    G = (s+a)/((s)*(s+b));
    T = G/(1+G);
    [y,t] = step(T);
    plot(t, y, 'DisplayName', ['a = ' num2str(a)])
end

xlabel('tiempo')
title('Respuesta para distintos valores de a')
legend
grid on
hold off

%% Ejercicio 4
clc
clear
s = tf('s');

a = 0.0652; % Valor obtenido según los cálculos

G = 1/(s+a);
[y,t] = step(G);

%Grafiqueishon-----------------------------------
figure
plot(t,y)
hold on 

% Encuentra el índice más cercano 
[~, idx] = min(abs(t - 60));
[~, idx2] = min(abs(t - 45.946));

%Marca los puntos
plot(t(idx), y(idx), 'ro', 'MarkerSize', 10, 'DisplayName', ['Punto en t = ' num2str(t(idx))])
plot(t(idx2), y(idx2), 'ro', 'MarkerSize', 10, 'DisplayName', ['Punto en t = ' num2str(t(idx2))])

title(['Respuesta del termómetro para a = ' num2str(a)])
xlabel('Tiempo (s)')
ylabel('Respuesta')
legend
grid on
hold off

%% Ejercicio 6
clc
clear
s = tf('s');

K =12.459894; % valor calculado
tau = 1; % dato
Kh = 0.178081; % valor calculado

G =  K/(1+s*tau); %Transferencia sin realminetar, orden 1
H = Kh;
Taux = G/(s*(1+G*H)); %G realmentada con H=Kh y luego multiplicada por el integrador, orden 2
T = Taux/(1+Taux); %T2  realimentada, sistema de orden 2

%Grafiqueishon---------------------------------------
[y,t] = step(T);
figure
plot(t,y)
hold on
% Encuentra el índice más cercano 
[~, idx] = min(abs(t - 1)); %tiempo de sobrepico
[~, idx2] = min(abs(t - 2.4306)); %tiempo de establecimiento del 2%

%Marca los puntos
plot(t(idx), y(idx), 'ro', 'MarkerSize', 10, 'DisplayName', ['Punto en t = ' num2str(t(idx))])
plot(t(idx2), y(idx2), 'ro', 'MarkerSize', 10, 'DisplayName', ['Punto en t = ' num2str(t(idx2))])

%% Ejercicio 7
clc
clear
s = tf('s');

G1 = (s+1)/(s+50);
G2 = (s-2)/(s*(20*s+1));
G3 = (s+10)/(s*s*(s+100));
H = 1;

%Realimentados
T1 = G1/(1+G1*H);
T2 = G2/(1+G2*H);
T3 = G3/(1+G3*H);

[y1,t1] = step(T1);
[y2,t2] = step(T2);
[y3,t3] = step(T3);


%Graficaccione--------------------------------------
figure
subplot(1,3,1)
plot(t1,y1)
title('Sistema de tipo 0')

subplot(1,3,2)
plot(t2, y2)
title('Sistema de tipo 1')

subplot(1,3,3)
plot(t3, y3)
title('Sistema de tipo 2')

%% Ejercicio 10
clear
clc
s = tf('s');
%a) Eee = Ess, ya que H = 1
%b) 
G = 12/(s*(s+2)*(0.4*s+1));
H = (s+2)/(s+5);
T = G/(1+G*H);%realimentado
[y,t] = step(T);


%c) 
G2 = 15/(s*s*(s+3)*(0.2*s+1));
H2 = (s+4)/(0.3*s+1);
T2 = G2/(1+G2*H2);%realimentado
[y2,t2] = step(T2);

%graficos
figure
subplot(1,2,1);
plot(t,y);
title('b')

subplot(1,2,2);
plot(t2,y2);
title('c')
