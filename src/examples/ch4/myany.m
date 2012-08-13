function logresult = myany(vec)
% Simulates the built-in function any

% Assume 0 for the result
logresult = logical(0);
for i = 1:length(vec)
	% if any value is not false, the result will be 1
	if vec(i) ~= 0
		logresult = logical(1);
	end
end