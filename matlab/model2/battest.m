function [R,MeanR,StdR,MaxR] = battest(L,M,H,Ic,w,v0,e,b,n)

% battest.m
% *************************************************************************
% This is the script test the performance of a give bat.
%
% h is the hight form ground to the point of collision. 
% ualp1 and ualp2 are the azimuth of baseball velocity relative to the bat.
% valp is the azimuth of bat velocity.
% u0 is the velocity of the baseball before collision and u is the after.

R=[];
for kk=1:n
m = 5; % oz
g=9.8; % m/s^2
h = 1+0.2*randn; % m

u0 = normrnd(85,5); % mph
ualp1 = normrnd(15,5)/180*pi;
ualp2 = normrnd(0,20)/180*pi;

v0 = normrnd(80,5); % mph
valp = normrnd(5,2)/180*pi;
theta =normrnd(25,5)/180*pi;

% 
V=[0,v0*cos(valp),v0*sin(valp)];
U=[u0*sin(ualp2),-u0*cos(ualp2)*cos(ualp1),-u0*cos(ualp2)*sin(ualp1)];
V=RotAxis(V,theta);
U=RotAxis(U,theta);

B=normrnd(b(1),b(2));
U2 = BatBallCollision(M,Ic,w,m,U(2),V(2),B,e);
U(2)=U2;
U=RotAxis(U,-theta);

t=(0.4470*U(3)+sqrt((0.4470*U(3))^2+2*g*h))/g;
XYZ=U*0.681818*t;
alpha=(45+5*rand)/180*pi;
XY=[XYZ(1)*cos(-alpha)-XYZ(2)*sin(-alpha),XYZ(1)*sin(-alpha)+XYZ(2)*cos(-alpha)];
r = sqrt(sum(XY.^2));
R=[R r];
subplot(1,2,1)
plot(XY(1),XY(2),'k.','markersize',8);
plotaxis
hold on
drawnow
end
MeanR=mean(R);
StdR=std(R);
MaxR=max(R);
xlabel(sprintf('R: mean = %.1f std = %.1f max = %.1f',MeanR,StdR,MaxR))
subplot(1,2,2)
hist(R)
h=histfit(R);
set(h(2),'color','k','linewidth',2);
[mu,sigma]=normfit(R);
xlabel(sprintf('R: mu = %.1f sigma = %.1f',mu,sigma));




