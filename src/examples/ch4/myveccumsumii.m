function outvec = myveccumsumii(vec)
% This function imitates cumsum for a vector
% It preallocates the output vector
outvec = zeros(size(vec));
runsum = 0;
for i = 1:length(vec)
	runsum = runsum + vec(i);
	outvec(i) = runsum;
end