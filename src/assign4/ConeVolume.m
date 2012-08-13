function [volume] = ConeVolume( height, radius )
    % The function ConeVolume expects expects 2 arguments the height and the
    % radius. It returns the volume of the inverted cone based on how full
    % it is.
    
    % compute ratio betweeen height and radius. this ratio will be used to
    % compute the new radius based on a partially filled cone with set
    % radius and a set cone dimension height of 2.
    ratio = radius / 2;
    volume = 1/3*pi*(height*ratio)^2*height;
end