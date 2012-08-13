function recursion12
%Recursion of simple square
global COLORMAP
n=8; %level of recursion
COLORMAP=1-copper(n);
rect(0,0,1,1,n);
axis([-0.75 0.75 -0.75 0.75]);
axis equal off

function rect(x,y,wide,high,n)
global COLORMAP
if n>0
    xx=[x-wide/2 x+wide/2 x+wide/2  x-wide/2];
    yy=[y-high/2 y-high/2 y+high/2  y+high/2];
    patch(xx,yy,'k',...
         'facecolor',COLORMAP(n,:),...
         'edgecolor','none','linewidth',1);
    rect(x-wide/4,y-high/4,wide/2,high/2,n-1);
    rect(x+wide/4,y+high/4,wide/2,high/2,n-1);
end
return