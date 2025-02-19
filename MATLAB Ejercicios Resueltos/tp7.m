%tp7, sistemas discretos
%% Ejercicio 1
clear
clc
% Defino T 

T = 0.1;

% Define the transfer functions in the s-domain
E1_s = tf([1], [1 2 1 0])       % E(s) = 1 / (s*(1 + s)^2)
E2_s = tf([1], [1 3 2]);         % E(s) = 1 / ((s + 1)*(s + 2))
E3_s = tf([1 1], [1 2 0]);       % E(s) = (s + 1) / (s*(s + 2))
E4_s = tf([1 1], [1 2 26]);      % E(s) = (s + 1) / (s^2 + 2*s + 26)

% Convert the transfer functions to the z-domain using zero-order hold
E1_z = c2d(E1_s, T, 'zoh');
E2_z = c2d(E2_s, T, 'zoh');
E3_z = c2d(E3_s, T, 'zoh');
E4_z = c2d(E4_s, T, 'zoh');

% Plot pole-zero maps for each z-domain transfer function
figure;
subplot(2,2,1);
pzmap(E1_z);
title('Polos y Ceros de E1(z)');

subplot(2,2,2);
pzmap(E2_z);
title('Polos y Ceros de E2(z)');

subplot(2,2,3);
pzmap(E3_z);
title('Polos y Ceros de E3(z)');

subplot(2,2,4);
pzmap(E4_z);
title('Polos y Ceros de E4(z)');

%% Ejericio 2
clear
clc
% Definir los parámetros
T = 0.1;  % Periodo de muestreo

% Definir las funciones de transferencia en el dominio s
E_s = tf([1], [1 0]);             % E(s) = 1/s
M_s = tf([1 -1], [1 0])          % M(s) = (1 - e^(-Ts)) / s
C_s = tf([1 0], [1 1]);           % C(s) = s / (s + 1)

% Multiplicar las funciones de transferencia
H_s = E_s * M_s * C_s;  % Función de transferencia total del sistema

% Convertir la función de transferencia total al dominio z
H_z = c2d(H_s, T, 'zoh');  % Usamos Zero-Order Hold (ZOH)

% Calcular la respuesta del sistema a una entrada de escalón unitario
step(H_z);
title('Respuesta al escalón unitario en los instantes de muestreo');


