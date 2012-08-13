function [volume] = HemiSphereVolume( height, radius )
    % The function HemiSphereVolume expects 2 arguments the height and the
    % radius. It returns the volume of the hemisphere based on how full it
    % is.
    
    if height > 3
        height = 3;
    end
    subheight = 3-height;
    topvolume = (pi * subheight^2 * radius) - (pi * subheight^3 / 3);
    volume = (2/3 * pi * radius^3) - topvolume;
    % my method subtracts the not filled portion of the hemisphere from the
    % volume of a full hemisphere.
    
    % your suggested method
    % v =1/6 * pi * height * (3*radius^2 + 3*b^2 + height^2);
    % i couldn't figure out how to use this method to calculate top radius
    
end