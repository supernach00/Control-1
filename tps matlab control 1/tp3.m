%tp3, estabilidad, routh y LDR
%% Ejercicio 1
clear
clc
s = tf('s');

G = (10)/((1+0.2*s)*(s*s+8*s+100));
H = 1;

rlocus(G*H);

%% Ejercicio 2 
clear
clc
s = tf('s');

GH_a = 1 / ((s + 5) * (s + 550)) * (4 / (s + 160));
GH_b = (1 - 3 * s) / (10 * s * (1.5 * s + 1));
GH_c = (3 * s - 1) / (10 * s * (1.5 * s + 1));
GH_d = (s^2 + 2 * s + 1) / (s * (s + 4) * (s + 1));
GH_e = (s^2 + 4 * s + 1000) / ((s + 1) * (s + 5) * (s + 10));
GH_f = (s^2 - 10 * s + 50) / (s * (s^2 + 10 * s + 50));

rlocus(GH_f);

%% Ejercicio 3
clear
clc
s = tf('s');

G = ((s+50)*(s+30))/(s*(s+1)*(s+10));
H = 1/((s+400)*(s+2000));

rlocus(G*H);

%% Ejercicio 4
clear
clc
s = tf('s');

G = 1/(s*(s+10)*(s-1));
H = (s-1)/(s+3);

rlocus(G*H);


