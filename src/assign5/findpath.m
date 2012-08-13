function [ path ] = findpath( map )
% This function returns a matrix after it finds the path to highest ground 
% based on inputed point on a map

    [c r] = ginput(1);
    atpeak = 0;
    reps = 0;
    currcol = round(c);
    currrow = round(r);
    xcords = [currcol];
    ycords = [currrow];
    while atpeak == 0 & reps < 1000
        neighbors = map(currrow-1:currrow+1,currcol-1:currcol+1);
        [maxVal, maxIdx] = max(neighbors(:));
        if (maxVal > map(currrow,currcol))
            if (maxIdx < 4)
                currcol = currcol - 1;
                if (maxIdx == 1)
                    currrow = currrow - 1;
                elseif (maxIdx == 3)
                    currrow = currrow + 1;
                end
            elseif (maxIdx < 7)
                if (maxIdx == 4)
                    currrow = currrow - 1;
                elseif (maxIdx == 6)
                    currrow = currrow + 1;
                end
            else
                currcol = currcol + 1;
                if (maxIdx == 7)
                    currrow = currrow - 1;
                elseif (maxIdx == 9)
                    currrow = currrow + 1;
                end
            end
            xcords(end+1) = currcol;
            ycords(end+1) = currrow;
        else
            atpeak = 1;
        end
        reps = reps + 1;
    end
    path = [ycords' xcords'];
end