%view([azimuth elevation]);
% Sets the viewpoint so you are looking in the negative y-direction with
% your eye at the z = 0 elevation.
%view([180 0]);

% You can move the viewpoint to a location below the axis origin using a
% negative elevation.
%view([-37.5 -30]);

% Rotate in the camera coordinate system to orbit the camera around the
% axes along a circle while keeping the center of a circle at the camera
% target
for i=1:36
    camorbit(10,0,'camera')
    drawnow
end

% Rotate the camera horizontally about a line defined by the camera target
% point and a direction that is parallel to the y-axis. Visualize this
% rotation as a cone formed with the camera target at the apex and the
% camera position forming the base.
for i=1:36
   camorbit(10,0,'data',[0 1 0])
   drawnow
end

% Selecting a perspective projection provides the perception of depth as 
% the camera passes through the interior of the isosurface (camproj).
%camproj perspective

% Setting the camera view angle to a fixed value prevents MATLAB from
% automatically adjusting the angle to encompass the entire scene as well
% as zooming in the desired amount (camva).
%camva(25)

% Camdolly
%surf(peaks)
%axis vis3d
%t = 0:pi/20:2*pi;
%dx = sin(t)./40;
%dy = cos(t)./40;
%for i = 1:length(t);
%    camdolly(dx(i),dy(i),0)
%    drawnow
%end

% View the object from directly overhead.
%az = 0;
%el = 90;
%view(az, el);

% Set the view along the y-axis, with the x-axis extending horizontally
% and the z-axis extending vertically in the figure.
%view([0 0]);

% Rotate the view about the z-axis by 180º.
%az = 180;
%el = 90;
%view(az, el);