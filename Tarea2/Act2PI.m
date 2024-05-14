%%Tarea 2 - Laboret
%Partiendo de los datos de la tarea 1
%S= 5 TR=4 Tm=0.3

%FDT continuo
G = zpk([-10],[-2 -1],[5])

%FDT discreto
Tm = 0.3;
Gd = c2d(G,Tm, 'zoh')

% Requerimientos
tR=4; %timpo 2% error
S=5;  %sobrepasamiento

%Obtencion parametros

pzita = -log(S/100)/sqrt(pi^2+(log(S/100))^2)

w0=4/(pzita*tR)

wd=w0*sqrt(1-pzita^2)

tD=2*pi/wd

r=exp(-pzita*w0*Tm)

omega = wd*Tm

%muestras por ciclo de la frecuencia amortiguada

m=tD/Tm

%ubicaccion polos en plano Z

[r1,ph1] = pol2cart(omega,r)

[r2,ph2] = pol2cart(-omega,r)

p1=r1+ph1*1i
p2=r2+ph2*1i

%grafica Rlocus y polos deseados
rlocus(Gd)
hold on;
scatter(r1,ph1,'red','x')
scatter(r2,ph2,'red','x')
hold off

%los polos no forman parte del lugar de raices, hay que desplazarlo para
%lograr especificaciones deseadas

%sistema de tipo 0, no se tiene polo integrador que permita trabajjar con
%la especificacion de ess. -> controlador PI y PID

%Diseño con SISOTOOL

sisotool(Gd)

%%testeo de git

%verificacion 
C %muestra el compensador importado de sisotool
F=minreal(feedback(C*Gd,1)) % sistema de lazo cerrado
poles=pole(F)
zeros=zero(F)
pzmap(F)
step(F) % respuesta al escalon
stepinfo(F)
%minreal(F)




