ims = cell(2);
im{1,1} = imread('eniac.jpg');
im{1,2} = imread('zx81.gif');
im{2,1} = imread('c64.jpg');
im{2,2} = imread('alienware.jpg');

figure
for iI=1:numel(im)
	subplot(2,2,iI);
	imagesc(im{iI});
	axis off;
	axis image;
	colormap(gray);
end