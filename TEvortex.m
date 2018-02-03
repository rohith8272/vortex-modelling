clear all
close all
clc
n=200; % number of vortices
x=linspace(-1,1,n); % positions in x
y=zeros(1,n); % positions in y
gamma=8*x.^3/n; % the vortical intensities
% marching in time
[xt,yt,t]=tourbitraj(x,y,gamma,20);
% mes for the velocity field
x=linspace(-3,3,20);
y=linspace(-4,0.5,20);
[X,Y]=meshgrid(x,y);
for ind=1:length(t);
% initial position in red
plot(xt(1,:),yt(1,:),'r.-','markersize',10); hold on
% present position in blue
plot(xt(ind,:),yt(ind,:),'b.-','markersize',10);
% vorticity field
u=0*X; v=0*X;
for gre=1:n
x0=xt(ind,gre); y0=yt(ind,gre);
uu=-gamma(gre)*(Y-y0)./(2*pi*((X-x0).^2+(Y-y0).^2+0.05));
vv=gamma(gre)*(X-x0)./(2*pi*((X-x0).^2+(Y-y0).^2+0.05));
u=u+uu; v=v+vv;
end
whitebg('grey')
quiver(X,Y,u,v,2,'k'); hold on
hold off; axis equal; axis([-3,3,-4,0.5]);
xlabel('x'); ylabel('y'); title('nappe');grid on
drawnow;pause(.4)
end