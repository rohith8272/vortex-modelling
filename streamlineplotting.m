clear all
close all
clc

%stream line plotting of vector data
%%determine range of coordinates
load wind
xmin=min(x(:));
xmax=max(x(:));
ymax=max(y(:));
zmin=min(z(:));

%%add slice planes for visual context
wind_speed=sqrt(u.^2+v.^2+w.^2)
hsurfaces=slice(x,y,z,wind_speed,[xmin,100,xmax],ymax,zmin);
set(hsurfaces,'Facecolor','interp','Edgecolor','none')

%add contour lines to the slice planes
hcont=...
contourslice(x,y,z,wind_speed,[xmin,100,xmax],ymax,zmin);
set(hcont,'EdgeColor',[.7,.7,.7],'LineWidth',.5)


%defining starting point for stream lines
[sx,sy,sz]=meshgrid(80,20:10:50,0:5:15);
hlines=streamline(x,y,z,u,v,w,sx,sy,sz);
set(hlines,'Linewidth',2,'Color','r')

view(3)
daspect([2,2,1])
axis tight
