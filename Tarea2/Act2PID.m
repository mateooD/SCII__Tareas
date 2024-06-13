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

omega = rad2deg(wd*Tm)

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

sisotool(Gd)


%%PID
thetaZero = rad2deg(atan(0.2292/(0.7408+0.1076)))
theta1  = rad2deg(atan(0.2292/(0.7408)))
theta2    = 90
theta3    =180 - rad2deg(atan(0.2292/(0.3146)))

theta= thetaZero-theta1-theta2-theta3

ang=theta+180 %angulo

d=0.2292/atan(55) %distancia

c2=0.7408-0.1476 %cero

C


FPID= minreal(feedback(C*Gd,1)) % sistema de lazo cerrado
poles=pole(FPID)
zeros=zero(FPID)
pzmap(FPID)
step(FPID) % respuesta al escalon
stepinfo(FPID)


%%TEST SIMULINK
T=0.30
pid(C)

