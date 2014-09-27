% Main1model2.m
% *************************************************************************
% This is the main script to simulate the different material bat.

% M is the mass of the bat and m is the mass of baseball.
% w0 is the rotation of the bat before collision and w is the after.
% v0(1) is the mean velocity of the bat at the point of Centroid before
% collision and v0(2) is the standard deviation.
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
v0=[80 5];
b=[6.6 6.5 10.2 7.3 8.5 8.3 8.5; 5 5 5 5 5 5 5 ];
for i =1:length(L)
    figure('position',[320,100,800,300],'resize','off');
    hold on
    [R,MeanR,StdR,MaxR] = battest(L(i),M(i),H(i),Ic(i),w,v0,e(i),b(:,i),100);
    subplot(1,2,1)
    text(500,500,strcat('B',num2str(i)))
end
