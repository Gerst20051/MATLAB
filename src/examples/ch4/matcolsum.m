function outsum = matcolsum(mat)
% Calculates the sum of every column in a matrix
% Returns a vactor of the column sums
[row col] = size(mat);
% Preallocate the vector to the number of columns
outsum = zeros(1,col);
% Every column is being cummed so the outer loop
% has to be over the columns
for i = 1:col
	% Initialize the running sum to 0 for every column
	runsum = 0;
	for j = 1:row
		runsum = runsum + mat(j,i);
	end
	outsum(i) = runsum;
end