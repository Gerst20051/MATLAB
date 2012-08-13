cd C:\Users\gerst\Documents\MATLAB\assign1
x = imread('me_andrew.jpg');
y = imread('friend1_kerry.jpg');
z = imread('friend2_karolis.jpg');
xbw = rgb2gray(x);
ybw = rgb2gray(y);
zbw = rgb2gray(z);
x = double(xbw);
y = double(ybw);
z = double(zbw);
figure
imagesc((x+y+z)/3)
axis equal
colormap(gray(256))