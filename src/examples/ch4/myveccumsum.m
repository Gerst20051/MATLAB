function outvec = myveccumsum(vec)
% This function imitates cumsum for a vector
outvec = [];
runsum = 0;
for i = 1:length(vec)
	runsum = runsum + vec(i);
	outvec = [outvec runsum];
end