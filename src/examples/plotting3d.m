%%
radius = 2;
x = -radius:.1:radius;
y = x;
[X,Y] = meshgrid(x,y);
Zsq = radius .^ 2 - X .^ 2 - Y .^ 2;
positivesphere = sqrt(Zsq .* (Zsq >= 0));
surf(X, Y, positivesphere);
axis equal;
%%
% PLOT a HEMISPHERE (using spherical
% coordinates as parameters)

u = linspace(0, pi/2, 50);
v = linspace(0, 2*pi, 50);
[U,V] = meshgrid(u,v);
R = 7;
X = R * sin(U) .* cos(V);
Y = R * sin(U) .* sin(V);
Z = R * cos(U);
surf(X,Y,Z);
%%
load elevation
%%
figure, surf( map, 'facecolor', 'r', 'edgecolor', 'none');
figure, surf( map, 'facecolor', 'r', 'edgecolor', 'none');
light
%%
fnG = @(x,y)exp(-(x.^2+y.^2));
figure, h = ezsurf( fnG, [-3 3 -3 3] );
set( h, 'facecolor', 'b', 'edgecolor', 'none' );
%%
lightangle( -35, 30 );
lighting phong
%%
[x,y] = meshgrid( linspace(-3,3,100), linspace( -3, 3, 100 ) );
figure, h = surfl( x, y, x.^2 + y.^2, 'light');  shading interp
 figure, h = surfl( x, y, x.^2 + y.^2, 'light'); shading interp
material metal
%%
figure, h = ezsurf( fnG, [-3 3 -3 3] );
%%
set( h, 'facecolor', 'b', 'facealpha', 0.5 ); shading interp
lightangle( -35, 30 );
%%
[x,y] = meshgrid( linspace(-3,3,100), linspace( -3, 3, 100 ) );
z = x.^2 + y.^2;
figure, contour3( x, y, z );
%%
figure, h = surf( x, y, z ); hold on
set( h(1), 'facecolor','b', 'edgecolor', 'none', 'facealpha', 0.75);
[cV, cH] = contour3( x, y, z ); 
for iI=1:length( cH )
    set( cH(iI), 'linewidth', 3 );
end
material shiny; light
%%
[x,y] = meshgrid( linspace(-3,3,10), linspace( -3, 3, 10 ) );
z = x.^2 + y.^2;
 figure, stem3( x, y, z );
%%
load mri
D = double( squeeze( D ) );  % is stored as a 4D dataset, but is really 3D
% now slice through it
centerSlices = floor( size(D)/2 );
figure
slice( D, centerSlices(1),  centerSlices(2),  centerSlices(3) );
colormap( gray );

%% You can create pretty arbitrary slice planes with the surface commands we
% already learned

% Create a curved surface

[x,y,z] = meshgrid( linspace(-pi/2,pi/2,size( D, 1) ), linspace(-pi/2, pi/2,size( D, 2 ) ), linspace(-pi/2, pi/2, size( D, 3 ) ) );
[xs,ys] = meshgrid( linspace(-pi/2,pi/2,size( D, 1) ), linspace(-pi/2, pi/2,size( D, 2 ) ) );

zs = cos(xs).*cos(ys);

% show what it looks like

figure
h = surf( xs,ys, zs); 

% now use it to slice the MR data

xS = get( h, 'xdata' );
yS = get( h, 'ydata' );
zS = get( h, 'zdata' );

figure
slice( x, y, z, D, xS, yS, zS );
colormap(gray)

%% Visualizing vector fields

% Matlab also has functionality to visualize vector fields

load wind
[sx sy sz] = meshgrid(80,20:10:50,0:5:15);
figure
streamribbon(x,y,z,u,v,w,sx,sy,sz);
shading interp
view(3);
camlight; lighting gouraud
%%
       load wind
       [sx sy sz] = meshgrid(80, 20:10:50, 0:5:15);
       daspect([1 1 1])
       verts = stream3(x,y,z,u,v,w,sx,sy,sz);
       cav = curl(x,y,z,u,v,w);
       spd = sqrt(u.^2 + v.^2 + w.^2);
       h=streamribbon(verts,x,y,z,cav,spd);
       axis tight
       shading interp;
       view(3);
       camlight; lighting gouraud
%%
       t = 0:.15:15;
       verts = {[cos(t)' sin(t)' (t/3)']};
       twistangle = {cos(t)'};
       daspect([1 1 1])
       h=streamribbon(verts,twistangle);
       axis tight
       shading interp;
       view(3);
       camlight; lighting gouraud

%% Visualizing special geometric functions

% Visualizing a sphere

[X,Y,Z] = sphere( 100 ); % creates the matrices for surf

figure
surf( X, Y, Z );
axis equal

%% Visualizing a cylinder

[X,Y,Z] = cylinder( 20*ones(50,1), 100 ); % radius 20, 100 steps

figure
surf( X, Y, Z )

%% Can also be used to generate cylinders with different radii

[X,Y,Z] = cylinder( 40+10*sin(linspace(-pi,pi,40)), 100 );

figure
surf( X, Y, Z, 'facecolor', 'blue', 'edgecolor', 'none' );
light
material shiny

%% Use meshgrid to create a 3-D surface plot of a function

[X,Y] = meshgrid(-2:.2:2, -2:.2:2);                                
Z = X .* exp(-X.^2 - Y.^2);                                        
surf(X,Y,Z)

%% Movies

% Example, create movie for heat equation evolution

%% Solving a simple PDE (heat flow in 1D)
% u_t = u_xx
% This is equivalent to Gaussian smoothing

% Demonstrate it with a sine function with added noise

vals = linspace( 0, 2*pi, 100 );
valsSin = sin( vals );
valsSinNoise = valsSin + randn( size( valsSin ) )*0.1;

res = computeHeatFlow( valsSinNoise, 2000, 50 );

%% now create the output figures and save them to make a movie

mov = avifile('myMovie.avi', 'compression', 'none', 'quality', 100 );
frames = {};

figure
for iI=1:size( res, 1 )
  currentData = res(iI,:);
  clf
  hold on
  plot( valsSinNoise, 'r' );
  plot( currentData , 'k' );
  box on
  axis tight
  
  frames{iI} = getframe(gcf);
  mov = addframe(mov, frames{iI} );
  
end

mov = close(mov);
%%
    % Prepare the new file.
    vidObj = VideoWriter('peaks.avi');
    open(vidObj);
 
    % Create an animation.
    Z = peaks; surf(Z);
    axis tight
    set(gca,'nextplot','replacechildren');
 
    for k = 1:200
       surf(sin(8*pi*k/20)*Z,Z)
 
       % Write each frame to the file.
       currFrame = getframe;
       writeVideo(vidObj,currFrame);
    end
  
    % Close the file.
    close(vidObj);
