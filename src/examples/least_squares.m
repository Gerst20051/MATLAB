%% Quiz 4 Practice (Lease Sqaures)
% set up and solve matrix equation A[m;c] = y
% y = m(x) + c

clear
x = [1:1:10]';
y = [5.84 8.87 11.76 13.71 14.52 17.71 21.80 24.25 25.23 29.18]';
A = [x,ones(10,1)];
mc = A\y;
Y = mc(1)*x+mc(2);
plot(x,y,'ro');
hold on
plot(x,Y);

% evaluate error
est = A*mc;
residue = est - y;
err = residue' * residue;

% SSD error

est2 = A*mc;
residue2 = (est2 - y).^2;
ssderr = residue2' * residue2;