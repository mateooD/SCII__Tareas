%%Tarea 1 - Laboret
%Se tiene para cada alumno en un archivo adjunto (PDF) una funcion de transferencia con polos
%p1 y p2, probablemente un cero y una ganancia K, ademas especificaciones de Sobrepaso, tiempo de 
%respuesta 2%, y periodo de muestreo

%Valores Alumno Diaz Mateo 
% Ceros: -10 , polos: -2, -1, K: 5, Tm: 0.3
%


%Funcion de transferencia continua G(s) lazo abierto
G = zpk([-10],[-2 -1],[5])

%Defino periodo de muestreo
Tm = 0.3;

%FunciÃ³n de transferencia discretizada G(z) lazo abierto con Z0H entrada y tiempo muestreo asignado Tm

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


%Se multiplica por 10 el periodo  de muestreo, se obtiene la siguiente expresion:

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
 
%Comparacion 3 respuestas
step(G, 'b')
hold on
step(Gd, 'r')
step(Gd1, 'g')
% Añadir títulos y etiquetas al gráfico
title('Respuestas a entrada escalón')
legend('G(s)', 'G(d)', 'G(d1)')
grid on



%% Analisis Sistema Discreto
%Detrmino cantidad de polos en el origen.

pole(Gd)

%Tipo 0 -> tiene ess -> Para el calculo KP frente a una rampa del mismo podemos aplicar

Kp=dcgain(Gd)

%Comprobamos dicho error en donde cerramos el lazo de realimentacion con
%ganancia 1

F=feedback(Gd,1)
step(F)
title('Respuesta escalon sistema lazo cerrado')
grid

%Obtenemos ess y comparamos con dcgain
ess=1/(Kp+1)
dcgain(F)

%Sabemos qque el sistema es de tipo 0, el error en estado estable para una
%entrada tipo rampa tiende a infinito, es decir la salida diverfe para
%entrada

t=0:Tm:100*Tm % genera rampa
lsim(F,t,t)
title('Error estado estacionario Rampa')
grid

%%
%Lugar de raices 
rlocus(G)
title('Lugar de raíces para G(s)')

rlocus(Gd)
title('Lugar de raíces para G_D(z)')

Gmc=margin(G)
Gmd=margin(Gd)

%Estabilidad relativa al aumentar periodo de muestreo
rlocus(Gd1) 
title('Lugar de raíces para G_D(z1)')
Gmd1=margin(Gd1)