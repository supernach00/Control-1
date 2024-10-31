%tp5, compensación
%% Ejercicio 1
clc
clear
s = tf('s');

GH = 8/(s*(1+0.5*s));
C = (s+2.92)/(s+5.46);

rlocus(GH*C);

%% Ejercicio 2
clc
clear
s = tf('s');

GH = 2/((1+0.1*s)*(6+2*s));
C = ((s+5.53))/(s);

rlocus(GH*C);

%% Ejercicio 3

clc
clear
s = tf('s');

GH = (s-50)/((s)*(s+10));

C0 = -1;
C1 = (1+s/2.85)/(s+1);
C2 = (S+0.01)/(S+0.001);
rlocus(GH*C0*C1*C2);

%% Ejercicio 5
clc
clear
s = tf('s');

GH = 4/((s)*(s+0.5));
C = ((s+0.5)*(s+0.016))/((s+5)*(s+0.001));

Cgabi = ((s+0.0001)*(1+s/2.5))/((s+0.008)*(1+ s/8.7));

rlocus(GH*Cgabi);

%% Ejercicio 6
clc
clear
s = tf('s');

GH = 16/(s*(s+2));
C1a = (s+3.75)/(s+14);
C1b = (s+2.16)/(s+6.4951);
C1c = (0.2719)/(1);

bode(GH)

%% Ejercicio 7
clc;
clear;

s = tf('s');

% Definición de GH y C
GH = (8)/(s*(s+4)*(0.0625*s+1));
C = (s+0.01)/(s+0.001);

% Crear una ventana gráfica
figure;

% Primer subplot para el lugar de raíces de GH
subplot(2,1,1);  % Dividimos la ventana en 2 filas y 1 columna, seleccionamos la primera parte
rlocus(GH);
title('Lugar de Raíces de GH');


% Segundo subplot para el lugar de raíces de GH*C
subplot(2,1,2);  % Seleccionamos la segunda parte de la ventana
rlocus(GH*C);
title('Lugar de Raíces de GH*C');



%% Ejercicio 8
clc
clear
s = tf('s');

GH = (8000*(s+1))/((s+10)*(s+200));

%opcion 1
C1 = 1/s;
C2 = 31.622;
C3 = (1866/500)*(s+500)/(s+1866);
CA = C1*C2*C3

%opcion 2
C1 = 1/s;
C2 = (s/0.022+1);
C3 = (s/0.0201+1);
CB = C1*C2

rlocus(GH*C1*C3);
% bode(GH*C3*C1);v

%% Ejercicio 9
clc
clear
s = tf('s');

GH = (-100)/((s+10)*(s+50));

%opcion 1
C1 = -1/s; %souciono Eee escalon = 0
C2 = 250; %soluciono Eee rampa = 0.02
C3 = (1+s/0.04); %plancho la ganancia a 60db entre 0 y 1 rad/s
C4 = (1+s/787)/(1+s/8995.45);% agrego 50 de fase a 724rad/s
CA = C1*C2*C3*C4;

rlocus(GH*CA);
bode(GH*CA);

%% Ejercicio 11

clc
clear
s = tf('s');

GH = (s+20)*0.4/((s+1)*(s+5));
C1 = (s+0.0625)/(s*(1+s/0.1));
C2 = (1+s/8.144);
C = C1*C2;

bode(GH*C)
