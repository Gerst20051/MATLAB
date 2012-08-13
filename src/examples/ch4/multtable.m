function outmat = multtable(rows,columns)
% Creates a matrix which is a multiplication table

% Preallocate the matrix
outmat = zeros(rows,columns);
for i = 1:rows
	for j = 1:columns
		outmat(i,j) = i * j;
	end
end