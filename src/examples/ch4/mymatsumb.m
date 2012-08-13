function outsum = mymatsum(mat)
% Calculates the overal sum of the elements
% in a matrix
[row col] = size(mat);
outsum = 0;
% The outer loop is over the columns
for i = 1:col
	for j = 1:row
		outsum = outsum + mat(j,i);
	end
end