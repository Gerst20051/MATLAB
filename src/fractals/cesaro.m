phi=[0 pi/2 pi/2 pi/2];
theta=[85*pi/180 -170*pi/180 85*pi/180]; 
%theta=[-85*pi/180 170*pi/180 -85*pi/180]; %for inside out
%theta=[-80*pi/180 160*pi/180 -80*pi/180]; %
%theta=[80*pi/180 -160*pi/180  80*pi/180]; %

iter=5;  %don't exceed 6
angle_new=[];
for n=1:iter
   angle_new=[angle_new theta(1) angle_new theta(2) angle_new theta(3) angle_new];
end

angle_new=[phi(1) angle_new ...
           phi(2) angle_new ...
           phi(3) angle_new ...
           phi(4) angle_new ...
           0];


len_angle=length(angle_new);
x_arr=zeros(len_angle,1);
y_arr=zeros(len_angle,1);
x=0;y=0;x1=0;y1=0;
angle_2=0;
for n=1:len_angle
    [x1,y1]=pol2cart(angle_2,1);
    angle_2=angle_new(n)+angle_2;
    x=x+x1;
    y=y+y1;
    x_arr(n)=x;
    y_arr(n)=y;
end
%plot(x_arr,y_arr,'linewidth',1);
axis off square
x_arr=[x_arr;nan];
y_arr=[y_arr;nan];
patch(x_arr,y_arr,sqrt(x_arr.^2+y_arr.^2),...
           'edgecolor','flat','facecolor','none','facevertexcdata',hsv(length(x_arr)));