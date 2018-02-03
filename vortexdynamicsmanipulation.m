clear all
close all
clc
%vortex dynamics---0
x=linspace(0,2*pi,20)
y=linspace(0,2*pi,20)
[X,Y]=meshgrid(x,y)

n=100
tvec=linspace(0,4*pi,n);
for ind =1:n
    t=tvec(ind)
    u=sin(X).*cos(Y-t)
    v=-cos(X).*sin(Y-t)
    
    quiver(X,Y,u,v,'b');
    drawnow %;pause(.4)
end
    