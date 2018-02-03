clear all
close all
clc


t=0:pi/20:2*pi


gamma=pi
del=0.2%relaxation factor
x1=5;
x2=-1; 
y1=3;
y2=4;


x=0:0.1:10
y=0:0.1:10

%for i=1:100
    %for j=1:100
       % u(i,j)=gamma*(-(y(j)-y1)/(2*pi*(x(i)-x1)^2+(y(j)-y1)^2)+del)%- (gamma*(-(y(j)-y2))/(2*pi*(x(i)-x2)^2+(y(j)-y2)^2+del))
       % v(i,j)=gamma*(-(x(i)-x1))/(2*pi*(x(i)-x1)^2+(y(j)-y1)^2+del)%- (gamma*(-(x(i)-x2))/(2*pi*(x(i)-x2)^2+(y(j)-y2)^2+del))
   % end
%end

%quiver(u,v)

%y=exp(sin(t));

h=plot(t,y,'Ydatasource','u');
for i=1:100
    for j=1:100
    u(i,j)=gamma*(-(y(j)-y1)/(2*pi*(x(i)-x1)^2+(y(j)-y1)^2)+del)
    refreshdata(h,'caller')
    drawnow;pause(.1)
    end
end