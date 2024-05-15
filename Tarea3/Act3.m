%%Tarea 3 - Laboret

%funcion de transferencia

p1=1
p2=-2
K=10
G=zpk([],[p1 p2],K)
sisotool(G)

%se llama a sisotool y ajustamos ganancia para cancelar el polo eestable de
%la planta y obtener el tiempo de establecimiento deseado

%Kc=0.5

%exporto C

%Constantes para simmulacion relé con histeresis


Kc = 0.5 % ganancia de C
a = -2 % cero del controlador con signo invertido
M = 1 % ganancia rele 
T=0.1 % histeresis
lineal = 1 % simula control lineal
sim('bang_bang_hist_DI_PD')
figure(1)
subplot(2,2,1);plot(tout,yout(:,1),'r','LineWidth',2);grid on;hold on; title('Error'); % error
subplot(2,2,2);plot(yout(:,1),yout(:,3),'b','LineWidth',2);grid on; hold on; title('Plano de fases');
xlabel('Error');ylabel('Derivada del error');% plano de fases: eje x error, eje y derivada del error
subplot(2,1,2);plot(tout,yout(:,2),'m','LineWidth',2);grid on; hold on; title('Acción de control'); % señal de control





%%Error regimen

%Tiempo de establecimiento

