% Main3model.m
% *************************************************************************
% This is the main script to simulate the wood and metal bat.
%
% L,M,H,D are defined as the follow figure:
%                                             O                       
% ||====o================|||||||||c|||||||||||o||||||
%
% |<-6->|<--------- H ----------->|<--- B --->|<-D->|
% |<---------------------- L ---------------------->|
% 
% M is the mass of the bat and m is the mass of baseball.
% w0 is the rotation of the bat before collision and w is the after.
% v0 is the velocity of the bat at the point of Centroid before collision.
% and v is the after.
% u0 is the velocity of the baseball before collision and u is the after.
% Ic is the moment of inertia of the bat about the centroid.
% e is the ball-bat coefficient of restitution.

L = [34 33];    % in
M = [30.9 29.2];% oz
H = [23 20.7]-6;% in
D = L-H-6;      % in
Ic = [11516 9282]-M.*H.^2; % oz-in^2
w = 1.5; % rad/s
e = -[0.45 0.5];
m = 5; % oz
u0 = -85; % mph
v0 = [67.9 70.9]; % mph

U = [];
for D = 0:0.1:12
    B=L-(H+6)-D;
    u = BatBallCollision(M,Ic,w,m,u0,v0,B,e);
    U = [U ;u];
end

[umax,I]=max(U);
for i=1:2
D = 0:0.1:12;
B=L(i)-(H(i)+6)-D;
b(i)=B(I(i));
end
b


hold on
plot(0:0.1:12,U(:,1),'k- ','linewidth',1.5)
plot(0:0.1:12,U(:,2),'k--','linewidth',1.5)

MM1=max(U(:,1))
MM2=max(U(:,2))

legend('Wood ','Metal')
xlabel('Distance from Barrel Bat End (in)','fontsize',13)
ylabel('Velocity (mph)','fontsize',13)
box on