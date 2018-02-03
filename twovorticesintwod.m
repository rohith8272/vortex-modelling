clear all
close all
clc

% 2D grid
x=linspace(-3,3,20);
y=linspace(-3,3,25);
[X,Y]=meshgrid(x,y);


% vortex positions
x1=1; y1=0; g1=1;
x2=-1; y2=0; g2=-1;


% the velocity field for each vortex
u1=-g1*(Y-y1)./(2*pi*((X-x1).^2+(Y-y1).^2+0.05));
v1=g1*(X-x1)./(2*pi*((X-x1).^2+(Y-y1).^2+0.05));
u2=-g2*(Y-y2)./(2*pi*((X-x2).^2+(Y-y2).^2+0.05));
v2=g2*(X-x2)./(2*pi*((X-x2).^2+(Y-y2).^2+0.05));
% sum of the velocity fields

u=u1+u2;
v=v1+v2;

% graph
drawnow
quiver(X,Y,u,v,2); hold on
plot(x1,y1,'r.',x2,y2,'b.','markersize',20)
hold off
xlabel('x'); ylabel('y');
title('Deux tourbillons');
