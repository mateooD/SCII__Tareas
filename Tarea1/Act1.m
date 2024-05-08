%%Tarea 1 - Laboret
%Se tiene para cada alumno en un archivo adjunto (PDF) una función de transferencia con polos
%p1 y p2, probablemente un cero y una ganancia K, además especificaciones de Sobrepaso, tiem-
%po de respuesta 2%, y periodo de muestreo

%Valores Alumno Diaz Mateo 
% Ceros: -10 , polos: -2, -1, K: 5, Tm: 0.3
%
pkg load control

%Función de transferencia continua G(s) lazo abierto
G = zpk([-10],[-2 -1],[5])

%Defino periodo de muestreo
Tm = 0.3;

%Función de transferencia discretizada G(z) lazo abierto con Z0H entrada y tiempo muestreo asignado Tm

Gd = c2d(G,Tm, 'zoh')

%Mapa de polos y ceros del sistema continuo
figure('Name','Polos y ceros de G(s)')
pzmap(G)
title('Polos y ceros de G(s)')
grid on

%Mapa de polos y ceros del sistema discretizado
figure ('Name','Polos y ceros de G(z)')
pzmap(Gd)
title('Polos y ceros de G(z)')
grid on


Se multiplica por 10 el período  de muestreo, se obtiene la siguiente expresión:

Gd1 = c2d(G,10*Tm,'zoh')

% Diagrama de polos y ceros es el siguiente:
figure ('Name','Polos y ceros de G(z1)')
pzmap(Gd1)
title('Polos y ceros de G(z1)')
grid on

%Se observa que los polos se acercan al origen

%Respuesta a entrada escalon G
step(G)
%hold on
title('Respuesta a entrada escalon de G(s)')
grid on

%Respuesta a entrada escalon Gd
step(Gd)
title('Respuesta a entrada escalon de G(d)')
grid on

%Respuesta a entrada escalon Gd1
step(Gd1)
title('Respuesta a entrada escalon de G(d1)')
grid on


%Superponer 3 graficas -FALTA

%% Analisis Sistema Discreto
%Detrmino cantidad de polos
pole(Gd)


step(Gd1)
title('Respuesta a entrada escalon de G(d1)')
grid on
