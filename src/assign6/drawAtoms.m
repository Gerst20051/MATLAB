function ret = drawAtoms(queryName, marker, aname, coords)
% This function plots any atoms with aname matching the queryName.

    query = strtrim(queryName);
    name = cellstr(aname);
    coord = [];
    for idx = 1:length(name)
        if strcmp(query,name{idx})
            coord = [coord; [coords(idx,1) coords(idx,2) coords(idx,3)]];
        end
    end
    plot3(coord(:,1),coord(:,2),coord(:,3),marker);
end