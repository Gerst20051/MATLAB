function pytree
x=[-1 1 1 -1];
y=[-1 -1 1 1];
level=8; %level of recursion
tree(x,y,0,level);
axis equal
return

function tree(x,y,theta,n)
if n>0
     [xx,yy]=trans2d(x,y,0,0,pi/4);
     tree(xx*0.707-1,yy*0.707+2,theta+pi/4,n-1);
     
     [xx,yy]=trans2d(x,y,0,0,-pi/4);
     tree(xx*0.707+1,yy*0.707+2,theta+pi/4,n-1);
     
     phi=mod(atan2(y(1),x(1))+pi,pi)/pi;
     colors=hsv2rgb([phi 1 1]);
     patch(x,y,'y','facecolor',colors);
end
return

function [xx,yy]=trans2d(x,y,tx,ty,phi)
  [theta,rad]=cart2pol(x,y);
  xx=rad.*cos(theta+phi)+tx;
  yy=rad.*sin(theta+phi)+ty;
return