% Main3model2.m
% *************************************************************************
% This is the main script to simulate the wood and metal bat.

% M is the mass of the bat and m is the mass of baseball.
% w0 is the rotation of the bat before collision and w is the after.
% v0(1) is the mean velocity of the bat at the point of Centroid before
% collision and v0(2) is the standard deviation.
% Ic is the moment of inertia of the bat about the centroid.
% e is the ball-bat coefficient of restitution.

L = [34 33];    % in
M = [30.9 29.2];% oz
H = [23 20.7]-6;% in
D = L-H-6;      % in
Ic = [11516 9282]-M.*H.^2; % oz-in^2
w = 1.7; % rad/s
e = -[0.45 0.5];
m = 5;  % oz
v0=[80;5];
% Translate the moment of inertia form point o to the bat about the centroid
Ic = [11516 9282]-M.*H.^2; % oz-in^2
b = [6.6 7.5; 5 5]; %in

for i =1:length(L)
    figure('position',[320,100,800,300],'resize','off');
    hold on
    str={'Wood ','Metal'};
    text(450,500,str(i))
    [R,MeanR,StdR,MaxR] = battest(L(i),M(i),H(i),Ic(i),w,v0,e(i),b(:,i),100);
end
