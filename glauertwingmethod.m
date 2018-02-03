clear all
close all
clc

s=1
alpha=1*pi/180
alpha0=0;
uinf=15
rho=1.2
N=20
th=[1:N]'/N*pi/2;
y=-cos(th)*s
c=0.370+zeros(size(th));

n=1:2:2*N-1;

r=pi*c/4/s*(alpha-alpha0).*sin(th);
c=sin(th*n).*(pi*c*n/4/s+repmat(sin(th),1,N));
a=inv(c)*r;
gamma=4*uinf*s*sin(th*n)*a;
whitebg('white')
%plot(y,gamma)
int = integral(gamma,s,-s)
L=rho*uinf*int
Cl=L/(0.5*rho*uinf.^2*0.635)
Clbycref=Cl/0.318
plot(y,Clbycref)
Cl=L/(0.5*rho*uinf.^2*0.635)