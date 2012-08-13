[fid, msg] = fopen('file.dat', 'r');
if (fid == -1)
	% Error, opening file
	disp(msg);
end