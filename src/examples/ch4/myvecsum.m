function outarg = myvecsum(vec)
% This function sums the elements in a vector
outarg = 0;
for i 1:length(vec)
	outarg = outarg + vec(i);
end