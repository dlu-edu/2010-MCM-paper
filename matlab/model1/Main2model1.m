% Main2model1.m
% *************************************************************************
% This is the main script to simulate the performance of Unmodified and
% Corked bat.
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

L = [34 34];   % in
M = [35 33];   % oz
H = [22 21]-6; % in
D = L-H-6;     % in
Ic = [12000 10000]-M.*H.^2; % oz-in^2
w = 1.7; % rad/s
e = -[0.49 0.48];
m = 5;  % oz
u0 = -85;    % mph
v0 = [70 72];% mph

U = [];
for D = 0:0.1:12
    B=L-(H+6)-D;
    u = BatBallCollision(M,Ic,w,m,u0,v0,B,e);
    U = [U;u];
end

% [umax,I]=max(U);
% for i=1:2
% D = 0:0.1:12;
% B=L(i)-(H(i)+6)-D;
% b(i)=B(I(i));
% end
% b

hold on
plot(0:0.1:12,U(:,1),'k- ','linewidth',1.5)
plot(0:0.1:12,U(:,2),'k--','linewidth',1.5)

legend('Unmodified','Corked')
xlabel('Distance from Barrel Bat End (in)','fontsize',13)
ylabel('Velocity (mph)','fontsize',13)
box on