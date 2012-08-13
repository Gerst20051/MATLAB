function [result] = MyPower( x, n )
% result = x^n where n is an integer >= 0
%          {  1                  if n = 0
% f(x,n) = {  f(x,n/2)^2         if n > 0 and n is even
%          {  f(x,(n-1)/2)^2*x   if n > 0 and n is odd
n = int32( n );  % force n to be an integer
if n == 0 % Check for trivial basis case
    result = 1;
elseif mod(n,2) == 0  % Check if n is even or odd
    % n is even
    x1 = MyPower( x, n/2 );
    result = x1 * x1;
else
    % n is odd
    x1 = MyPower( x, (n-1)/2 );
    result = x1 * x1 * x;
end
    
    