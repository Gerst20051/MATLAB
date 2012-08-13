a0=logical([1 1 1;1 1 1;1 1 1]);
b0=logical([0 1 0;1 0 1;0 1 0]);
for n=1:5  %don't exceed 6 because of expanding array inside loop 
    an=[b0 b0 b0;b0 b0 b0;b0 b0 b0];
    b0=[a0 b0 a0;b0 a0 b0;a0 b0 a0];
    a0=an;
end
imagesc(b0),colormap(gray(2));
imwrite(b0,'haferman1.png','bitdepth',1);