function [volume] = CylinderVolume( height, radius )
    % The function CylinderVolume expects expects 2 arguments the height and the
    % radius. It returns the volume of that cylinder.
    
    volume = pi*radius^2*height;
end