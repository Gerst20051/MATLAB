clear
clf
x = 0;
y = 0;
plot(x,y);
hold on
for it = 1:200000
    %fprintf('A: (%1.3f, %1.3f)\n',x,y);
	choic = floor(rand*3);
    %fprintf('Choice: %1.3f\n',choic);
	if choic == 0
		x = x/2;
		y = y/2;
        plot(x,y,'b');
	elseif choic == 1
		x = (x+1)/2;
		y = y/2;
        plot(x,y,'r');
	else
		x = (x+0.5)/2;
		y = (y+1)/2;
        plot(x,y,'g');
	end
	%fprintf('B: (%1.3f, %1.3f)\n\n',x,y);
end
axis([0,1,0,1]);