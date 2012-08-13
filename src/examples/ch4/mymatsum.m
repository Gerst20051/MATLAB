function outsum = mymatsum(mat)
% Calculates the overal sum of the elements
% in a matrix
[row col] = size(mat);
outsum = 0;
% The outer loop is over the rows
for i = 1:row
	for j = 1:col
		outsum = outsum + mat(i,j);
	end
end