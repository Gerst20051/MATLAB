function y = calcy(x)
% This funtion calculates y based on x:
% y = 1 for x < -1
% y = x^2 for -1 <= x <= 2
% y = 4 for x > 2
if x < -1
	y = 1;
elseif x >= -1 && x <= 2
	y = x^2;
else
	y = 4;
end