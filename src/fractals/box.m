k=logical([1 0 1;0 1 0;1 0 1]);
for n=1:4
     b=logical(zeros(3^n));   
     k=[k b k;b k b;k b k];     
end

[mm,nn]=size(k);
[m,n]=find(k==1);
h=scatter(m,n,10,(m+n));
set(h,'marker','x')
axis equal off,
colormap hsv(256)