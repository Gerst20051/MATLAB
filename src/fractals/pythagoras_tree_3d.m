function pytree3d
x=[-1 1 1 -1];
y=[-1 -1 1 1];

vert=[1 1 1
      1 1 -1
      1 -1 1
      1 -1 -1
     -1 1 1
     -1 1 -1
     -1 -1 1
     -1 -1 -1];
 face=[1 4 3 2
       1 2 6 5
       5 8 4 1
       2 3 7 6
       3 4 8 7
       6 7 8 5];
   
level=8; %level of recursion

tree(x,y,face,0,level);
axis equal tight
view(3)
return

function tree(x,y,face,theta,n)

if n>0
     [xx,yy]=trans2d(x,y,0,0,pi/4);
     tree(xx*0.707-1,yy*0.707+2,face,theta+pi/4,n-1);
     
     [xx,yy]=trans2d(x,y,0,0,-pi/4);
     tree(xx*0.707+1,yy*0.707+2,face,theta+pi/4,n-1);
     
     phi=mod(atan2(y(1),x(1))+pi,pi)/pi;
     colors=hsv2rgb([phi 1 1]);
     len=sqrt((x(2)-x(1))^2+(y(2)-y(1))^2);
  
     vert=[x' zeros(4,1)-len/2 y';x' len*ones(4,1)-len/2 y'];
     
     patch('faces',face,'vertices',vert,'facecolor',colors);
end

return

function [xx,yy]=trans2d(x,y,tx,ty,phi)
  [theta,rad]=cart2pol(x,y);
  xx=rad.*cos(theta+phi)+tx;
  yy=rad.*sin(theta+phi)+ty;
return