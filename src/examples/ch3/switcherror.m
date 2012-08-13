% Example of otherwise for error message
choice = input('Enter a 1, 3, or 5: ');
switch choice
	case 1
		disp('It''s a one!!')
	case 3
		disp('It''s a three!!')
	case 5
		disp('It''s a five!!')
	otherwise
		disp('Follow directions next time!!')
end