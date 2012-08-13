function recursion6
global COLORMAP
golden = 1.618033988749894848204586; %golden ratio
n=4; %depth of recursion
COLORMAP=copper(4);
h=1;
pentaflake(n,0,0,36/180*pi,h);
axis([-3 3 -3 3])
axis equal off

function pentaflake(n,x,y,theta,len)
global COLORMAP
  if n>0
     golden = 1.618033988749894848204586;
     d=len/golden;
     h=len;
     t=linspace(0+theta,2*pi+theta,5+1);
     [offx,offy]=pol2cart(t+18/180*pi,d*(1+golden));%generate points around middle pentagon
     
     for k=1:5
         patch(h*sin(t)+offx(k)+x,h*cos(t)+offy(k)+y,0*cos(t)+4-n,'r',...
              'facecolor','none','edgecolor',COLORMAP(n,:),'linewidth',n); 
         pentaflake(n-1,x+offx(k),y+offy(k),theta,len/(golden+1));
     end

     patch(h*sin(t)+offx(k)+x,h*cos(t)+offy(k)+y,0*cos(t)+4-n,'r',...
           'facecolor','none','edgecolor',COLORMAP(n,:),'linewidth',n); 
     pentaflake(n-1,x,y,pi+theta,len/(golden+1));
  end
return