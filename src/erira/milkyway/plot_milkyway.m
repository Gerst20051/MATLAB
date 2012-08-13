%% 3D Plot of the Milky Way

clear all; close all;

files = {
    '005'
    '053'
    '080'
    '086'
    '135'
    '155'
    '170'
    '186'
    '196'
    '219'
    '239'
    '256'
    '273'
    '293'
    '300'
    '328'
    '343'
    '354'
    '381'
    '387'
    '403'
    '422'
    '441'
    '451'
    '466'
    '483'
    '493'
    '508'
    '524'
    '558'
    '573'
    '610'
    '640'
    '675'
    '704'
    '732'
    '761'
    '819'
    '833'
    '837'
    '846'
    '862'
    '873'
    '885'
    '894'
    '912'
};

ra = [
    .5
    5.3
    8.0
    8.6
    13.5
    15.5
    17.0
    18.6
    19.6
    21.9
    23.9
    25.6
    27.3
    29.3
    30.0
    32.8
    34.3
    35.4
    38.1
    38.7
    40.3
    42.2
    44.1
    45.1
    46.6
    48.3
    49.3
    50.8
    52.4
    55.8
    57.3
    61.0
    64.0
    67.5
    70.4
    73.2
    76.1
    81.9
    83.3
    83.7
    84.6
    86.2
    87.3
    88.5
    89.4
    91.2
];

A = [];
X = [];
Y = [];
Z = [];


%% Full Spectrum

clear all; close all;

files = {
    '005'
    '053'
    '080'
    '086'
    '135'
    '155'
    '170'
    '186'
    '196'
    '219'
    '239'
    '256'
    '273'
    '293'
    '300'
    '328'
    '343'
    '354'
    '381'
    '387'
    '403'
    '422'
    '441'
    '451'
    '466'
    '483'
    '493'
    '508'
    '524'
    '558'
    '573'
    '610'
    '640'
    '675'
    '704'
    '732'
    '761'
    '819'
    '833'
    '837'
    '846'
    '862'
    '873'
    '885'
    '894'
    '912'
};

ra = [
    .5
    5.3
    8.0
    8.6
    13.5
    15.5
    17.0
    18.6
    19.6
    21.9
    23.9
    25.6
    27.3
    29.3
    30.0
    32.8
    34.3
    35.4
    38.1
    38.7
    40.3
    42.2
    44.1
    45.1
    46.6
    48.3
    49.3
    50.8
    52.4
    55.8
    57.3
    61.0
    64.0
    67.5
    70.4
    73.2
    76.1
    81.9
    83.3
    83.7
    84.6
    86.2
    87.3
    88.5
    89.4
    91.2
];

A = [];
X = [];
Y = [];
Z = [];

for i = 1:length(files)
    A = csvread(strcat('mws_',files{i},'a_vel.csv'));
    xx(1:length(A),1) = ra(i);
    yy = A(:,1); % Velocity km/s
    zz = A(:,2); % Flux Intensity
    X = [X xx];
    Y = [Y yy];
    Z = [Z zz];
end

%[X,Y] = meshgrid(X,Y);
%plot3(X,Y,meshgrid(Z));
%III = interp2(Z,X,Y);
%contour(III);
surf(X,Y,Z);
shading interp
title('Milky Way - Full Spectrum');
%xlabel('Radial Velocity (km/s)'); % Longitude
%ylabel('Flux'); % Radial Velocity
%zlabel('Longitude'); % Flux
xlabel('Longitude'); % Longitude
ylabel('Radial Velocity'); % Radial Velocity
zlabel('Flux'); % Flux

%view(0, 90); % Directly Overhead
%view([0 0]); % Default

%for i=1:1800
%    camorbit(i/10,0,'camera');
%    view(0, i/20);
%    drawnow
%end




%% Individual Spectrums

for i = 1:length(files);
    figure(i);
    A = csvread(strcat('mws_',files{i},'a_vel.csv'));
    xx(1:length(A),1) = ra(i);
    yy = A(:,1); % Velocity km/s
    zz = A(:,2); % Flux Intensity
    plot(yy,zz);
    axis([-250 250 -1 5.5]);
    title({'Longitude',ra(i)});
    xlabel('Radial Velocity (km/s)');
    ylabel('Flux');
    shading interp
end


%% Create spectrum animation

vidObj = VideoWriter('spectrum.avi');
vidObj.FrameRate = 5;
open(vidObj);
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
for j = 1:4
    for i = 1:length(files);
        figure(i);
        A = csvread(strcat('mws_',files{i},'a_vel.csv'));
        xx(1:length(A),1) = ra(i);
        yy = A(:,1); % Velocity km/s
        zz = A(:,2); % Flux Intensity
        plot(yy,zz);
        axis([-250 250 -1 5.5]);
        title({'Longitude',ra(i)});
        xlabel('Radial Velocity (km/s)');
        ylabel('Flux');
        currFrame = getframe;
        if i < length(files)
            writeVideo(vidObj,currFrame);
        end
    end
end
close(vidObj);
close all;