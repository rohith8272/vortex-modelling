function [xtraj,ytraj,tvec]=tourbitraj(x,y,g,tmax);
% calcule la trajectoire de pleins de tourbillons en interaction
global gamma; gamma=g(:);
% utilise ode45 pour la marche en temps
% avec la fonction tourbiv
[tvec,sol]=ode45(@tourbiv,[0,tmax],[x(:);y(:)]);
% extraction du resultat sous le bon format
n=length(x);
xtraj=sol(:,1:n);
ytraj=sol(:,n+1:2*n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function speed=tourbiv(t,pos)
% cette fonction donne la vitesse induite aux points x,y
% par des tourbillons de circulation gamma en ces positions
global gamma
delta=0.05; % paramètre de régularisation
n=length(pos)/2;
x=pos(1:n); y=pos(n+1:2*n);
% allocation des tableaux pour les vitesses
u=zeros(n,1);
v=zeros(n,1);
% boucle sur les tourbillons
for ind=1:n
sel=1:n; sel(ind)=[];
% le denominateur (régularisé)
d=2*pi*((x(ind)-x(sel)).^2+(y(ind)-y(sel)).^2+delta);
% vitesses selon x et y
u(ind)=sum(-gamma(sel).*(y(ind)-y(sel))./d);
v(ind)=sum(gamma(sel).*(x(ind)-x(sel))./d);
end
speed=[u;v];