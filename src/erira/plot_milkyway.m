% 3D Plot of the Milky Way

clear all; close all;

% A = xlsread('milkyway.xlsx');
A = csvread('mws_837a.csv');
B = csvread('mws_862a.csv');
C = csvread('mws_885a.csv');

xa(1:length(A),1) = 83.7;
ya = A(:,3);
za = A(:,4);
xb(1:length(B),1) = 86.2;
yb = B(:,3);
zb = B(:,4);
xc(1:length(C),1) = 88.5;
yc = C(:,3);
zc = C(:,4);

xx = [xa;xb;xc];
yy = [ya;yb;yc];
zz = [za;zb;zc];

[XX,YY] = meshgrid(xx,yy);
mesh(XX,YY,meshgrid(zz));
shading interp


%% Part 2

xa(1:length(A)) = 83.7;
ya = A(:,3);
za = A(:,4);

[XA,YA] = meshgrid(xa,ya);
mesh(XA,YA,meshgrid(za));
hold on

xb(1:length(B)) = 86.2;
yb = B(:,3);
zb = B(:,4);

[XB,YB] = meshgrid(xb,yb);
mesh(XB,YB,meshgrid(zb));

xc(1:length(C)) = 88.5;
yc = C(:,3);
zc = C(:,4);

[XC,YC] = meshgrid(xc,yc);
mesh(XC,YC,meshgrid(zc));

shading interp