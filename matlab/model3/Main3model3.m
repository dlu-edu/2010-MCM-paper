UU=[];
for M=28:33
L = 34;  % in
M = 31;  % oz
H = 22-6;% in
D = L-H-6; % in
% Translate the moment of inertia form point o to the bat about the centroid
Ic = 11200-M.*H.^2; % oz-in^2
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
UU=[UU;U]
end
plot(0:0.1:10,UU,'linewidth',1.5)
legend('M=28','M=29','M=30','M=31','M=32','M=33');
xlabel('Distance from Barrel Bat End (in)')
ylabel('Velocity (mph)')
box on