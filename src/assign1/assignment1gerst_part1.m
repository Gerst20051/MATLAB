cd C:\Users\gerst\Documents\MATLAB\assign1 % “cd” means “Change Directory” so you are
% shifting attention to wherever it was you saved
% the pictures.
dir % you should see yourname.jpg there
% if you can’t see the file, you cannot load it
% with the next command.
x = imread('me_andrew.jpg');
% this “reads” your ”im”age image file into a
% variable (a place to put stuff) labeled “x”.
figure % this command opens a new figure window
imagesc(x) % a window with your distorted and perhaps
% discolored image should pop up.
axis equal; % image should stop being distorted
xbw = rgb2gray(x);
% converts your color image to a BW image!
imagesc(xbw); % let’s display the B&W image
% yikes! I will explain this later…
colormap(gray(256));
% image should now be in black and white
% Now use the “File -> Save As” command in the
% Figure window to save the new BW image!