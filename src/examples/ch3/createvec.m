function outvec = createvec(mymin, mymax)
% Create a vector that iterates from mymin to mymax

% If the minimum isn't smaller than the maximum,
% exchange the values using a temporary variable
if mymin > mymax
	temp = mymin;
	mymin = mymax;
	mymax = temp;
end
% Use the colon operator to create the vector
outvec = mymin:mymax;