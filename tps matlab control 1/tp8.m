%tp8
%% Ejercicio 3
clc
clear
Hz = tf([1],[1 -0.5],0.1);
Hw = d2c(Hz,'tustin');
nyquist(Hw);

%% Ejercicio 4
clc
clear
Ho = tf([1],[1 -0.5 0],0.1)
Hr1 = tf([1],[1])
Hr2 = tf([1],[1 -0.5],0.1)
rlocus(Ho);

%% Ejercicio 5
clc
clear
Gs = tf([0.2],[1 2 0])
Gz = c2d(Gs,1,'zoh')
Dz = tf([1],[1]);
Gw = d2c(Gz*Dz,'tustin')
bode(Gw);


%% Ejercicio 7
clc
clear
GHs = tf([(1*0.4*2.6*20*0.04)],[3 1])
GHz = c2d(GHs,0.5,'zoh')
Dz = tf([1],[1]);
GHw = d2c(GHz*Dz,'tustin')
bode(GHw) 
