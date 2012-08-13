function recursion2
  %recursion2
  global COLORMAP
  n=7; %depth of recursion
  COLORMAP=pink(n);
  x=1;
  y=1;
  wide=1;
  high=1;
  rect(x,y,wide,high,n);
  axis([0 2 0 2])
  axis equal off
return

function rect(x,y,wide,high,n)
 global COLORMAP
 if n>0
    xx=[x-wide/2 x+wide/2 x+wide/2  x-wide/2];
    yy=[y-high/2 y-high/2 y+high/2  y+high/2];

    rect(x-wide/2,y-high/2,wide/2,high/2,n-1);
    rect(x-wide/2,y+high/2,wide/2,high/2,n-1);
    rect(x+wide/2,y-high/2,wide/2,high/2,n-1);
    rect(x+wide/2,y+high/2,wide/2,high/2,n-1);
    
    patch(xx,yy,n*ones(size(yy))*0,'k',...
         'facecolor',COLORMAP(n,:),'edgecolor','none');
 end
return