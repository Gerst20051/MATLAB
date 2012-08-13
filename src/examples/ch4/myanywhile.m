function logresult = myanywhile(vec)
% Simulates the built-in function any
% Uses a while loop so that the action halts
% as soon as any true value is found
logresult = logical(0);
i = 1;
while i <= length(vec) && logresult == 0
	if vec(i) ~= 0
		logresult = logical(1);
	end
	i = i + 1;
end