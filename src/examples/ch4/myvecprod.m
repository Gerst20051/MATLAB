function outarg = myvecprod(vec)
% This function finds the product of
% the elements in a vector
outarg = 1;
for i 1:length(vec)
	outarg = outarg * vec(i);
end