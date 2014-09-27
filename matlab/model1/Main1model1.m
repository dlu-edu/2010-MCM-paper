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

L = [34    34     34    34    33   33   33  ];  % in
M = [31.2  36.5   37.3  31.9  31.4 31.0 30.5];  % oz
H = [22.8  22.4   20.3  21.2  19.9 20.4 19.3]-6;% in
D = L-H-6; % in
% Translate the moment of inertia form point o to the bat about the centroid
Ic = [11239 12283 11836 10127 9325 9590 8664]-M.*H.^2; % oz-in^2
w = 1.7; % rad/s
e = -[0.5 0.5 0.5 0.55 0.55 0.55 0.55]; 
m = 5; % oz
u0 = -85; % mph
v0 = 80;  % mph

U = [];
for D = 0:0.1:10
    B=L-(H+6)-D;
    u = BatBallCollision(M,Ic,w,m,u0,v0,B,e);
    U = [U ;u];
end

% [umax,I]=max(U);
% for i=1:7
% D = 0:0.1:10;
% B=L(i)-(H(i)+6)-D;
% b(i)=B(I(i));
% end
% b

hold on
plot(0:0.1:10,U(:,1),'k: ','linewidth',1.5)
plot(0:0.1:10,U(:,2),'k-.','linewidth',1.5)
plot(0:0.1:10,U(:,3),'k--','linewidth',1.5)
plot(0:0.1:10,U(:,4),'k- ','linewidth',1.5)

plot(0:0.1:10,U(:,5),'b-.','linewidth',1.5)
plot(0:0.1:10,U(:,6),'b--','linewidth',1.5)
plot(0:0.1:10,U(:,7),'b- ','linewidth',1.5)
legend('B1','B2','B3','B4','B5','B6','B7')
xlabel('Distance from Barrel Bat End (in)')
ylabel('Velocity (mph)')
box on