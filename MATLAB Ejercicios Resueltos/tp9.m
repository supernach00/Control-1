%tp9
%% Ejercicio1
clc
clear
GHs = tf([1],[1 1 0])
GHz = c2d(GHs,1,'zoh') 

GHw = d2c(GHz,'tustin')
bode(GHw)

%% Ejercicio 3
clc
clear
GHs = tf([(1*0.4*2.6*20*0.04)],[3 1])
GHz = c2d(GHs,0.5,'zoh')
Dz = tf([0.8571 -0.25713],[1 -0.4], 0.5)
rlocus(GHz*Dz)
GHw = d2c(GHz,'tustin')

%% Ejercicio 6
clc
clear
Gs = tf([0.2],[1 2 0])
Gz = c2d(Gs,1,'zoh')
Dw = tf([1],[1 0.1463])
Dz = c2d(Dw,1,'zoh')
Gw = d2c(Gz*Dz,'tustin')
bode(Gw);

%% Ejercicio 10
clc
clear
Gs = tf([2],[1 3 2 0])
Gz = c2d(Gs,3,'zoh')
Gw = d2c(Gz,'tustin')
bode(Gw)
