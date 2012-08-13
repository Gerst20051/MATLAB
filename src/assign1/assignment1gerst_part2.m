cd C:\Users\gerst\Documents\MATLAB\assign1
dir
x = imread('me_andrew.jpg');
y = imread('friend1_kerry.jpg');
% now go through the same process you went through above to
% convert the second picture to BWsc
xbw = rgb2gray(x);
ybw = rgb2gray(y);
x = double(xbw);
y = double(ybw);
figure
imagesc((x+y)/2)
axis equal
colormap(gray(256))