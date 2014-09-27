% Main1model1.m
% *************************************************************************
% This is the main script to simulate the different material bat.
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
UU=[];
for H=14:18
L = 34;  % in
M = 31;  % oz
%H = 22-6;% in
D = L-H-6; % in
% Translate the moment of inertia form point o to the bat about the centroid
Ic = [11200]-M.*H.^2; % oz-in^2
w = 1.7; % rad/s
e = -0.5; 
m = 5; % oz
u0 = -85; % mph
v0 = 80;  % mph

U = [];
for D = 0:0.1:10
    B=L-(H+6)-D;
    u = BatBallCollision(M,Ic,w,m,u0,v0,B,e);
    U = [U  u];
end
UU=[UU;U];
end
plot(0:0.1:10,UU,'linewidth',1.5)
legend('H=14','H=15','H=16','H=17','H=18')
xlabel('Distance from Barrel Bat End (in)')
ylabel('Velocity (mph)')
box on


