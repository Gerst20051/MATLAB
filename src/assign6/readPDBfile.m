function [anum, aname, coords] = readPDBfile(infile)
% This function reads the atoms for a protein and returns their serial
% number, atom name, and coordinates.

	fid = fopen(infile,'rt');
    if fid == -1
        return
    end
    anum = []; aname = []; coords = [];
    while ~feof(fid)
        line = fgetl(fid);
        record = line(1:6);
        num = line(7:11);
        name = line(13:16);
        seqnum = line(23:26);
        xcoord = line(31:38);
        ycoord = line(39:46);
        zcoord = line(47:54);
        coord = [str2double(xcoord) str2double(ycoord) str2double(zcoord)];
        if strcmp(record,'ATOM  ')
            anum = [anum;str2num(num)];
            aname = [aname;upper(name)];
            coords = [coords;coord];
        end
    end
    aname = strtrim(aname);
    fclose(fid);
end