%%MODIFICANDO EL SISTEMA
%se trabaja con sistema no lineal
%M=Kc
%T= K*Kc/100
C
Kc = 0.5 % ganancia de C
a = 2 % cero del controlador con signo invertido
M = Kc % ganancia rele 
T= K*Kc  % histeresis
lineal = 0 % simula control lineal
sim('bang_bang_hist_DI_PD')
figure(1)
subplot(2,2,1);plot(tout,yout(:,1),'r','LineWidth',2);grid on;hold on; title('Error'); % error
subplot(2,2,2);plot(yout(:,1),yout(:,3),'b','LineWidth',2);grid on; hold on; title('Plano de fases');
xlabel('Error');ylabel('Derivada del error');% plano de fases: eje x error, eje y derivada del error
subplot(2,1,2);plot(tout,yout(:,2),'m','LineWidth',2);grid on; hold on; title('Acción de control'); % señal de control


%T= K*Kc/100 % histeresis
%T= K*Kc/25
%T= K*Kc/10
%T= K*Kc
