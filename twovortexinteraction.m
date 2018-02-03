clear all
close all
clc
% comparison with two vortices
n=200; % number of vortices
x=linspace(-1,1,n); % x positions
y=zeros(1,n); % y positions
gamma=8*x.^3/n; % circulations
tmax=20; % final time
% march in time
[xt,yt,t]=tourbitraj(x,y,gamma,tmax);
% the two wing-tip vortices
[xtt,ytt,tt]=tourbitraj([-1,1],[0,0],[-1,1],tmax);
% y position of all vortices of the sheet
plot(t,yt,'k'); hold on
% just for the first and last vortces of the sheet
plot(t,yt(:,[1,end]),'m','linewidth',2);
% the two large vortices
plot(tt,ytt,'r','linewidth',4);
xlabel('t'); ylabel('y');
title('Comparaison nappe/tourbillons d''aile')