function logresult = myall(vec)
% Simulates the built-in function all

% count how many values are true
count = 0;
for i = 1:length(vec)
	if vec(i) ~= 0
		count = count + 1;
	end
end
% if all were true, return 1 else return 0
if count == length(vec)
	logresult = logical(1);
else
	logresult = logical(0);
end