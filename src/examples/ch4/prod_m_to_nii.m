function outprod = prod_m_to_nii(m,n)
% Product of m to n using : and prod
if m < n
	outprod = prod(m:n);
else
	outprod = prod(m:-1:n);
end