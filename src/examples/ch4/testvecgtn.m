function outvec = textvecgtn(vec,n)
% Compare each element in vec to see whether it
% is greater than n or not

% Preallocate the vector
outvec = zeros(size(vec));
for i = 1:length(vec)
	% Each element in the output vector stores 1 or 0
	if vec(i) > n
		outvec(i) = 1;
	else
		outvec(i) = 0;
	end
end