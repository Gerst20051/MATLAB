function rc = findpits(map)
% returns a matrix containing 2 columns with row and column of all non-boundary pits in map.
% will call findLowNhbr();

    [roffset coffset] = findLowNhbr(map);
    [r c] = find(roffset == 0 & coffset == 0);
    rc = [r c];
end