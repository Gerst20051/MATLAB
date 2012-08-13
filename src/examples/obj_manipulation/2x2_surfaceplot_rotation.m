figure
sp11 = subplot(2,2,1);
h11 = surf(sp11, peaks(20));
title('No Rotation')
sp12 = subplot(2,2,2);
h12 = surf(sp12, peaks(20));
title('Rotation Around X-Axis')
zdir = [1 0 0];
rotate(h12,zdir,25)
sp21 = subplot(2,2,3);
h21 = surf(sp21, peaks(20));
title('Rotation Around Y-Axis')
zdir = [0 1 0];
rotate(h21,zdir,25)
sp22 = subplot(2,2,4);
h22 = surf(sp22, peaks(20));
title('Rotation Around X- and Y-Axis')
zdir = [1 1 0];
rotate(h22,zdir,25)