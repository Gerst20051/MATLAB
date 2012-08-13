% This script calculates the area of a circle
% It error-checks the user's radius
radius = input('Please enter the radius: ');
if radius <= 0
	fprintf('Sorry: %.2f is not a valid radius\n',radius)
else
	area = calcarea(radius);
	fprintf('For a circle with a radius of %.2f,',radius)
	fprintf('the area is %.2f\n',area)
end