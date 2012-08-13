b0=logical([1 1 1;1 0 1;1 1 1]);
for n=1:5 %don't exceed 6 because of expanding array inside loop
    x=logical(zeros(3^n));
    b0=[b0 b0 b0;b0 x b0;b0 b0 b0];
end
imagesc(b0),colormap(gray(2));
imwrite(b0,'sierpinski1.png','png','bitdepth',1);