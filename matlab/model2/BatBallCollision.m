function ui=BatBallCollision(Mi,Ici,w0i,mi,u0i,v0i,Bi,ei)
% BatBallCollision.m
% *************************************************************************
% This is the script to solve the collision equations.

% M is the mass of the bat and m is the mass of baseball.
% w0 is the rotation of the bat before collision and w is the after.
% v0 is the velocity of the bat at the point of Centroid before collision.
% and v is the after.
% u0 is the velocity of the baseball before collision and u is the after.
% Ic is the moment of inertia of the bat about the centroid.
% e is the ball-bat coefficient of restitution.

syms M w0 w v0 v   m Ic  u0 u  e B
% The total momentum for the bat and ball before and after the collision is
% conserved.
eq1='m*u0+M*(v0+B*w0)=m*u+M*(v+w)';

% Conserving angular momentum between the bat and the ball during the
% collision produces
eq2='Ic*(w-w0)+B*m*(u-u0)=0';

% The ball-bat coefficient of restitution.
eq3='e=(u-v-B*w)/(u0-v-B*w0) '; 
[u,v,w]=solve(eq1,eq2,eq3,'u,v,w');
ui=subs(u,{M,Ic,w0,m,u0,v0,B,e},{Mi,Ici,w0i,mi,u0i,v0i,Bi,ei});