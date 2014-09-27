UU=[];
for Io=9800:600:12800
L = 34;  % in
M = 31;  % oz
H = 22-6;% in
D = L-H-6; % in
% Translate the moment of inertia form point o to the bat about the centroid
Ic = Io-M.*H.^2; % oz-in^2
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
legend('Ic=9800','Ic=10400','Ic=11000','Ic=11600','Ic=12200','Ic=12800');
xlabel('Distance from Barrel Bat End (in)')
ylabel('Velocity (mph)')
box on