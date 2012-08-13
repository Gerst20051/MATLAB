function [liters] = GasTankVolume( currHeight )
    % The function GasTankVolume expects 
    
    radius = 3;
    if currHeight > 2
        volume = ConeVolume(2,radius);
        if currHeight > 7
            volume = volume + CylinderVolume(5,radius) ...
                + HemiSphereVolume(currHeight-7,radius);
        else
            volume = volume + CylinderVolume(currHeight-2,radius);
        end
    elseif currHeight > 0
        volume = ConeVolume(currHeight,radius);
    else
        volume = 0;
    end

    liters = 1000 * volume;
end