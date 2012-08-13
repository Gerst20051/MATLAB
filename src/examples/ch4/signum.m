function outmat = signum(mat)
% This function imiates the sign function
[r c] = size(mat);
for i = 1:r
	for j = 1:c
		if mat(i,j) > 0
			outmat(i,j) = 1;
		elseif mat(i,j) == 0
			outmat(i,j) = 0;
		else
			outmat(i,j) = -1;
		end
	end
end