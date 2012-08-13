function numvec = forinputvec(n)
% Prompts the user and puts the numbers into a vector
numvec = zeros(1,n);
for iv = 1:n
	inputnum = input('Enter a number: ');
	numvec(iv) = inputnum;
end