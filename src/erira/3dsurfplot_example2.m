% clears command window, clears variables and closes figures
clc; clear; close all

% defines vectors x and y
vx = -4 : 0.2: 4;
vy = -3 : 0.2: 3;

% calculates the necessary grid
[x,y] = meshgrid(vx, vy);

% calculates z and avoids a null denominator adding 'eps'
% (eps is the least possible number in Matlab)
z = x .* y .* (x.^2 - y.^2) ./ (x.^2 + y.^2 + eps);

% generates the first figure using 'plot3'
figure
plot3(x,y,z)
grid on

% generates the second figure using 'meshc' to include the
% contour in the figure, and rotates the figure with 'view'
figure
meshc(x,y,z)
view(-37, 15)

% generates the third 3D figure using 'surfc' to include the
% contour in the image, and also rotates the figure with 'view'
figure
surfc(x,y,z)
view(-47, 25)