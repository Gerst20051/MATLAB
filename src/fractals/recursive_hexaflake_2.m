function recursion8
%hexaflake 2
global COLORMAP
n=4; %levels of recursion
COLORMAP=summer(n);
h=1;
t=linspace(0,2*pi,6+1);

hexaflake(n,0,0,h);
axis([-3 3 -3 3]);
axis equal off

function hexaflake(n,x,y,len)
  global COLORMAP
  if n>0
     
     d=len;
     t=linspace(0,2*pi,6+1);
     [offx,offy]=pol2cart(t,d*2*0.866); %generate points around middle hexagon
     for k=1:6
        patch(d*sin(t)+offx(k)+x,d*cos(t)+offy(k)+y,0*cos(t)-n,'r'...
              ,'facecolor','none','edgecolor',COLORMAP(n,:),'linewidth',n);
        hexaflake(n-1,x+offx(k),y+offy(k),d/3);
     end
     
     patch(d*sin(t)+x,d*cos(t)+y,0*cos(t)-n,'r',...
         'facecolor','none','edgecolor',COLORMAP(n,:),'linewidth',n); 
     hexaflake(n-1,x,y,d/3);
     
  end
return