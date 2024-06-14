%Tarea 4 - Pendulo
%Datos - Diaz Mateo

%Parametros
m= 2;
b= 0.4;
l= 1;
G= 10;
delta= 180;
p_triple= -3;


%Variables de estados -  verificacion autovalores,estabilidad y
%controlabilidad

[A,B,C,D]=linmod('pendulo_mod_tarea',delta*pi/180)
eig(A)
rank(ctrb(A,B))

%Ampliar matrices 
Aa = [[A;C] zeros(3,1)]
Ba = [B;0]
eig(Aa)
rank(ctrb(Aa,Ba))

%Diseño asignacion polos
p= -3
K=acker(Aa,Ba,[p p p])
k1=K(1)
k2=K(2)
k3=K(3)
eig(Aa-Ba*K) % polos lazo cerrado
tscalc=7.5/(-p) % tiempo de respuesta calculado

%% SIMULACION

sim('pendulo_PID_tarea')
figure(1), plot(tout,yout)
grid on, title('Salida')
figure(2), plot(yout,velocidad) %plano de fase 
grid on, title('Plano de fases')
figure(3), plot(tout,torque) % torque total
grid on, title('Torque')
figure(4), plot(tout,-accint) % acción integral
grid on, title('Accion integral')
ymax=max(yout) % máximo valor de salida
S=(ymax-delta)/delta*100 % sobrepaso en %
erel=(delta-yout)/delta; %error relativo
efinal=erel(end) % error final, debe ser cero 
ind=find(abs(erel)>.02); % índice elementos con error relativo absoluto menor a 2% 
tss=tout(ind(end)) % tiempo de establecimiento (ultimo valor del vector)
yte=yout(ind(end)) % salida al tiempo ts
uf=torque(end) % torque final
Intf=-accint(end) % acción integral final

%%
%variar la masa del pendulo -10%
m= 2*0.9
b= 0.4;
l= 1;
G= 10;
delta= 180;
p_triple= -3;


%Variables de estados -  verificacion autovalores,estabilidad y
%controlabilidad

[A,B,C,D]=linmod('pendulo_mod_tarea',delta*pi/180)
eig(A)
rank(ctrb(A,B))

%Ampliar matrices 
Aa = [[A;C] zeros(3,1)]
Ba = [B;0]
eig(Aa)
rank(ctrb(Aa,Ba))

%Diseño asignacion polos
p= -3
K=acker(Aa,Ba,[p p p])
k1=K(1)
k2=K(2)
k3=K(3)
eig(Aa-Ba*K) % polos lazo cerrado
tscalc=7.5/(-p) % tiempo de respuesta calculado

sim('pendulo_PID_tarea')
figure(1), plot(tout,yout)
grid on, title('Salida')
figure(2), plot(yout,velocidad) %plano de fase 
grid on, title('Plano de fases')
figure(3), plot(tout,torque) % torque total
grid on, title('Torque')
figure(4), plot(tout,-accint) % acción integral
grid on, title('Accion integral')
ymax=max(yout) % máximo valor de salida
S=(ymax-delta)/delta*100 % sobrepaso en %
erel=(delta-yout)/delta; %error relativo
efinal=erel(end) % error final, debe ser cero 
ind=find(abs(erel)>.02); % índice elementos con error relativo absoluto menor a 2% 
tss=tout(ind(end)) % tiempo de establecimiento (ultimo valor del vector)
yte=yout(ind(end)) % salida al tiempo ts
uf=torque(end) % torque final
Intf=-accint(end) % acción integral final
%%
%variar la masa del pendulo -10%
m= 2*1.1
b= 0.4;
l= 1;
G= 10;
delta= 180;
p_triple= -3;


%Variables de estados -  verificacion autovalores,estabilidad y
%controlabilidad

[A,B,C,D]=linmod('pendulo_mod_tarea',delta*pi/180)
eig(A)
rank(ctrb(A,B))

%Ampliar matrices 
Aa = [[A;C] zeros(3,1)]
Ba = [B;0]
eig(Aa)
rank(ctrb(Aa,Ba))

%Diseño asignacion polos
p= -3
K=acker(Aa,Ba,[p p p])
k1=K(1)
k2=K(2)
k3=K(3)
eig(Aa-Ba*K) % polos lazo cerrado
tscalc=7.5/(-p) % tiempo de respuesta calculado

sim('pendulo_PID_tarea')
figure(1), plot(tout,yout)
grid on, title('Salida')
figure(2), plot(yout,velocidad) %plano de fase 
grid on, title('Plano de fases')
figure(3), plot(tout,torque) % torque total
grid on, title('Torque')
figure(4), plot(tout,-accint) % acción integral
grid on, title('Accion integral')
ymax=max(yout) % máximo valor de salida
S=(ymax-delta)/delta*100 % sobrepaso en %
erel=(delta-yout)/delta; %error relativo
efinal=erel(end) % error final, debe ser cero 
ind=find(abs(erel)>.02); % índice elementos con error relativo absoluto menor a 2% 
tss=tout(ind(end)) % tiempo de establecimiento (ultimo valor del vector)
yte=yout(ind(end)) % salida al tiempo ts
uf=torque(end) % torque final
Intf=-accint(end) % acción integral final
%%
%Comparacion
% Parámetros iniciales
m = 2;
b = 0.4;
l = 1;
G = 10;
delta = 180;
p_triple = -3;

% Simulación inicial
sim('pendulo_PID_tarea')
figure(1), plot(tout, yout, 'DisplayName', 'm = 2 kg')
grid on, title('Salida')
hold on
figure(2), plot(yout, velocidad, 'DisplayName', 'm = 2 kg')
grid on, title('Plano de fases')
hold on
figure(3), plot(tout, torque, 'DisplayName', 'm = 2 kg')
grid on, title('Torque')
hold on
figure(4), plot(tout, -accint, 'DisplayName', 'm = 2 kg')
grid on, title('Accion integral')
hold on

% Segunda simulación (m - 10%)
m = 2 * 0.9;
sim('pendulo_PID_tarea')
figure(1), plot(tout, yout, 'DisplayName', 'm = 1.8 kg')
figure(2), plot(yout, velocidad, 'DisplayName', 'm = 1.8 kg')
figure(3), plot(tout, torque, 'DisplayName', 'm = 1.8 kg')
figure(4), plot(tout, -accint, 'DisplayName', 'm = 1.8 kg')

% Tercera simulación (m + 10%)
m = 2 * 1.1;
sim('pendulo_PID_tarea')
figure(1), plot(tout, yout, 'DisplayName', 'm = 2.2 kg')
figure(2), plot(yout, velocidad, 'DisplayName', 'm = 2.2 kg')
figure(3), plot(tout, torque, 'DisplayName', 'm = 2.2 kg')
figure(4), plot(tout, -accint, 'DisplayName', 'm = 2.2 kg')

% Añadir leyendas a cada gráfico
figure(1)
legend show
figure(2)
legend show
figure(3)
legend show
figure(4)
legend show

% Eliminar 'hold on' para futuras gráficas
hold off