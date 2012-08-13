% 3D Plot of the Milky Way

clear all; close all;

% Method 1

files = {
    '005'
    '053'
    '086'
    '135'
    '155'
    '186'
    '196'
    '239'
    '293'
    '354'
    '381'
    '403'
    '422'
    '451'
    '466'
    '493'
    '837'
    '862'
    '885'
};

ra = [
    .5
    5.3
    8.6
    13.5
    15.5
    18.6
    19.6
    23.9
    29.3
    35.4
    38.1
    40.3
    42.2
    45.1
    46.6
    49.3
    83.7
    86.2
    88.5
];

X = [];
Y = [];
Z = [];

for i = 1:length(files)
    A = csvread(strcat('mws_',files{i},'a_vel.csv'));
    xx(1:length(A),1) = ra(i);
    yy = A(:,1); % Velocity km/s
    zz = A(:,2); % Flux Intensity
    X = [X;xx];
    Y = [Y;yy];
    Z = [Z;zz];
end

[X,Y] = meshgrid(X,Y);
plot3(X,Y,meshgrid(Z));
shading interp


%% Method 2

A = csvread('mws_005a_vel.csv');
B = csvread('mws_053a_vel.csv');
C = csvread('mws_086a_vel.csv');

xa(1:length(A),1) = .5;
ya = A(:,1); % Velocity km/s
za = A(:,2); % Flux Intensity
xb(1:length(B),1) = 5.3;
yb = B(:,1);
zb = B(:,2);
xc(1:length(C),1) = 8.6;
yc = C(:,1);
zc = C(:,2);

xx = [xa;xb;xc];
yy = [ya;yb;yc];
zz = [za;zb;zc];

[XX,YY] = meshgrid(xx,yy);
mesh(XX,YY,meshgrid(zz));
shading interp


%% Method 3

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