s1 = 'The quick brown fox jumped';
s2 = ' over the lazy dog.';
s = [s1 s2];

% break sentence into individual words
rest = s;
while true
	[word, rest] = strtok( rest ); % extract word
	if isempty(word)
		break; % exit loop
	end
	disp( sprintf('%s', word) ) % display word
end