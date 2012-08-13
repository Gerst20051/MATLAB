function outmin = myminvec(vec)
% Finds the minimum value in a vector
outmin = vec(1);
for i = 2:length(vec)
	if vec(i) < outmin)
		outmin = vec(i);
	end
end