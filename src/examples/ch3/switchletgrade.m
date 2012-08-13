function grade = switchletgrade(quiz)
% This function returns the letter grade corresponding
% to the integer quiz grade argument using switch

% First, error-check
if quiz < 0 || quiz > 10
	grade = 'X';
% If here, it is valid figure out the
% corresponding letter grade
else
	switch quiz
		case {10,9}
			grade = 'A';
		case 8
			grade = 'B';
		case 7
			grade = 'C';
		case 6
			grade = 'D';
		otherwise
			grade = 'F';
	end
end