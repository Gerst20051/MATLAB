% That is, we want to find the values of the coefficients (a0, a1, a2) that best fit these data to the form y = a0 + a1t + a2t2.
% We have 6 values each of t and y, from which we generate 6 equations in the format a0 + ta1 + t2a2 = y matching that required for solution of simultaneous linear equations:

% a0                           =  0.5
% a0 + 0.3a1 +0.32a2  =  0.82
% a0 + 0.8a1 +0.82a2  =  1.14
% a0 + 1.1a1 +1.12a2   =  1.25
% a0 + 1.6a1 +1.62a2   =  1.35
% a0 + 2.3a1 +2.32a2  =  1.40

% Thus we have six simultaneous equations, but only 3 unknowns.
% We cannot expect to get values for a0, a1 and a2 that would exactly satisfy all 6 equations.
% The backslash operator gives the least squares values instead.
% We must put these 6 equations in the form C*A=B, as follows (assuming t and y have already been entered, as above)

t = [0, .3, .8, 1.1, 1.6, 2.3];
y = [0.5, 0.82, 1.14, 1.25, 1.35, 1.40];
C(:,1) = ones(length(t),1);
C(:,2) = t;
C(:,3) = t.^2;
B = y;
A = C\B;
a0 = A(1), a1 = A(2), a2 = A(3);
tfit=0:0.1:2.3;
yfit = a0 + a1*tfit + a2*tfit.^2;
plot(t,y,'o',tfit,yfit);


%% Quiz 4 Practice

% f(x) = ax^2+bx+c

clear
X = [-1;3;4];
Y = [-1.6;21.56;33.6];
Z(:,1) = X.^2;
Z(:,2) = X;
Z(:,3) = ones(length(X),1);
A = Z\Y;
a = A(1);
b = A(2);
c = A(3);
