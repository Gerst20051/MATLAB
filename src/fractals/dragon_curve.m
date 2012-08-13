%dragon curve
dvec=['1'];
rough=[];
len_dvec=1;
iters=10;  %dont exceed 12
%loop to make sequence
%      110
%    1101100
%110110011100100
for loop_count=1:iters
    len_dvec=length(dvec);
    rough=dvec;
    rough(len_dvec*0.5+0.5)='0';
    dvec=[dvec '1' rough];
end

x=0;y=0;
len_dvec=length(dvec);
theta=pi/2;
x1=0;y1=0;x2=0;y2=0;
x_arr=zeros(len_dvec*2,1);
y_arr=zeros(len_dvec*2,1);
for k=1:len_dvec
    if dvec(k)=='1'
        [x1,y1]=pol2cart(theta,0.75);
        x=x+x1;y=y+y1;
        x_arr(2*k-1)=x;
        y_arr(2*k-1)=y;
        theta=theta+pi/4;
        [x2,y2]=pol2cart(theta,sqrt(2)*0.25);
        x=x+x2;y=y+y2;
        x_arr(2*k)=x;
        y_arr(2*k)=y;
        theta=theta+pi/4;
    else
        [x1,y1]=pol2cart(theta,0.75);
        x=x+x1;y=y+y1;
        x_arr(2*k-1)=x;
        y_arr(2*k-1)=y;
        theta=theta-pi/4;
        [x2,y2]=pol2cart(theta,sqrt(2)*0.25);
        x=x+x2;y=y+y2;
        x_arr(2*k)=x;
        y_arr(2*k)=y;
        theta=theta-pi/4;
    end
    
end

x_arr=[x_arr ; nan];
y_arr=[y_arr ; nan];
patch(x_arr,y_arr,sqrt(x_arr.^2+y_arr.^2),'edgecolor','interp','facecolor','none');
axis equal off,colormap hsv(64)