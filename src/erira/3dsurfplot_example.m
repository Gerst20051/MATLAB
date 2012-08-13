% define the coordinates
% along x and y
x=[-3:1:3];
y=[-3:1:2];

% define the coordinates
% along the x-y plane
[xx,yy]=meshgrid(x,y);

% define and compute the given
% function along the x-y coordinates
zz=xx.^2 - yy.^2;

% plot the function as a 3D mesh or surface
figure
surf(xx,yy,zz); % mesh(xx,yy,zz);
title('function z=x^2-y^2');
xlabel('elements in x');
ylabel('elements in y');
zlabel('elements in z');
axis tight
shading interp
colorbar