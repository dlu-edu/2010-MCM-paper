function V=RotAxis(V0,theta)
% RotAxis.m
% *************************************************************************
% This is the script to translate the axis: coordinate turn theta angle
% around the z-axis 
%
Vx=V0(:,1);
Vy=V0(:,2);
Vz=V0(:,3);
V=[Vx,Vy*cos(-theta) - Vz*sin(-theta), Vy*sin(-theta) + Vz*cos(-theta)];