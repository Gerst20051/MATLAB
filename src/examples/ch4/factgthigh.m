function facgt = factgthigh(high)
% Finds the first factorial > high
i = 0;
fac = 1;
while fac <= high
	i = i + 1;
	fac = fac * i;
end
facgt = fac;