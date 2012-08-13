function [roffset, coffset] = findLowNhbr(map)
% returns two matrices of the same size as map so that
% map(r,c) has map(r+roffset(r,c), c+coffset(r,c)) as minimum

    [r c] = size(map);
    roffset = repmat(2,size(map));
    coffset = repmat(2,size(map));
    for rr = 2:(r-1)
        for cc = 2:(c-1)
            neighbors = map(rr-1:rr+1,cc-1:cc+1);
            [minVal, minIdx] = min(neighbors(:));
            if (minVal < map(rr,cc))
                if (minIdx < 4)
                    coffset(rr,cc) = -1;
                    if (minIdx == 1)
                        roffset(rr,cc) = -1;
                    elseif (minIdx == 3)
                        roffset(rr,cc) = 1;
                    else
                        roffset(rr,cc) = 0;
                    end
                elseif (minIdx < 7)
                    coffset(rr,cc) = 0;
                    if (minIdx == 4)
                        roffset(rr,cc) = -1;
                    elseif (minIdx == 6)
                        roffset(rr,cc) = 1;
                    else
                        roffset(rr,cc) = 0;
                    end
                else
                    coffset(rr,cc) = 1;
                    if (minIdx == 7)
                        roffset(rr,cc) = -1;
                    elseif (minIdx == 9)
                        roffset(rr,cc) = 1;
                    else
                        roffset(rr,cc) = 0;
                    end
                end
            else
                coffset(rr,cc) = 0;
                roffset(rr,cc) = 0;
            end
        end
    end
end