function maxIndex = MaxIndex(V)
%<pre-cond>: V is a vector of 'n' values, n >= 1
maxIdx = 1; idx = 1; n = length(v);
while (1)
	%<loop-invariant>: V(maxIdx) is max in V(1:idx)
	if idx >= n % Loop Termination…
		break;
	end
	idx = idx + 1; % Make progress on each loop
	if V(idx) > V(maxIdx) % Maintain loop invariant
		maxIdx = idx; % Set new maximum index
	end
end
%<post-cond>: returns index of maximum value in V(1:n)
maxIndex = maxIdx;
end % Algorithm termination