function plotaxis
% plotaxis.m
% *************************************************************************
% This is the script to plot the baseball field axis
%
hold on
t=0:0.1:pi/2+0.1;
for k=1:6
    xi=k*100*cos(t);
    yi=k*100*sin(t);
    plot(xi,yi,'k:');
end

t=0:pi/12:pi/2;
for k =1:6
    xi=600*cos(t(k));
    yi=600*sin(t(k));
    plot([0,xi],[0,yi],'k:')
end

axis([0 600 0 600])
axis square
box off
hold off