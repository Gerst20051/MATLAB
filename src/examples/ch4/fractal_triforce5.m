clear
clf
x = rand;
y = rand;
plot(x,y,'k.');
hold on
for it = 1:500
    fprintf('A: (%1.3f, %1.3f)\n',x,y);
	choic = floor(rand*2);
    fprintf('Choice: %1.3f\n',choic);
	if choic == 0
		x = x/2;
		y = y/2;
        plot(x,y,'g.');
	elseif choic == 1
		x = (x+.5)/2;
		y = (y+1)/2;
        plot(x,y,'b.');
	else
		x = (x+.5)/2;
		y = (y+1)/2;
        plot(x,y,'r.');
    end
	fprintf('B: (%1.3f, %1.3f)\n\n',x,y);
    axis([0,1,0,1]);
end