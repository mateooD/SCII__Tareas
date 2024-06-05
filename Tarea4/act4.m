%Tarea 4 - Pendulo
%Datos - Diaz Mateo
m= 2;
b= 0.4;
l= 1;
G= 10;
delta= 180;
p_triple= -3;

[A,B,C,D]=linmod('pendulo_mod_tarea',delta*pi/180)
eig(A)
rank(ctrb(A,B))
