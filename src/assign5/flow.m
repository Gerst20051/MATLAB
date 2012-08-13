function result = flow(map)
% returns a matrix of the flow received by each pixel
    [height, idx] = sort(-map(:));
    arrflow = ones(size(map));
    for jj = 1:length(idx)
        [c,r] = ind2sub(size(map),idx(jj));
        try
            neighbors = map(r-1:r+1,c-1:c+1);
        catch err
            continue
        end
        [minVal, minIdx] = min(neighbors(:));
        if (minVal < map(r,c))
            if (minIdx < 4)
                lowcol = c - 1;
                if (minIdx == 1)
                    lowrow = c - 1;
                elseif (minIdx == 3)
                    lowrow = r + 1;
                end
            elseif (minIdx < 7)
                if (minIdx == 4)
                    lowrow = r - 1;
                elseif (minIdx == 6)
                    lowrow = r + 1;
                end
            else
                lowcol = c + 1;
                if (minIdx == 7)
                    lowrow = r - 1;
                elseif (minIdx == 9)
                    lowrow = r + 1;
                end
            end
            arrflow(lowrow,lowcol) = arrflow(lowrow,lowcol) + arrflow(r,c);
        end
    end
    result = arrflow;
end