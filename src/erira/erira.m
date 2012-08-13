% ERIRA Plotting

if 0 < length(center)
    save('data.mat', 'center');
end
clear all; close all;
load data.mat

% Choose Map
map = center;

%% Plot Channel A and B Voltage

hold on
plot(map(:,1),map(:,2),'r-');
plot(map(:,1),map(:,3),'b-');
hold off