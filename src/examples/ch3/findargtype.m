function outtype = findargtype(inputarg)
% This function determines whether the input
% argument is a scalar, vector, or matrix
[r c] = size(inputarg);
if r == 1 && c == 1
	outtype = 'scalar';
elseif r == 1 || c == 1
	outtype = 'vector';
else
	outtype = 'matrix';
end