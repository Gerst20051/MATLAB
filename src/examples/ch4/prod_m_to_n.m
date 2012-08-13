function runprod = prod_m_to_n(m,n)
% Product of m to n using a for loop
	
% Make sure m is less than n
if m > n
	temp = m;
	m = n;
	n = temp;
end
% Loop to calculate the running product
runprod = 1;
for i m:n
	runprod = runprod * i;
end