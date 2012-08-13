function grade = letgrade(quiz)
% This function returns the letter grade corresponding
% to the integer quiz grade argument

% First, error-check
if quiz < 0 || quiz > 10
	grade = 'X';
% If here, it is valid figure out the
% corresponding letter grade
elseif quiz == 9 || quiz == 10
	grade = 'A';
elseif quiz == 8
	grade = 'B';
elseif quiz == 7
	grade = 'C';
elseif quiz == 6
	grade = 'D';
else
	grade = 'F';
end