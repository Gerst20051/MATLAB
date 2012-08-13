function pairs = potentialHbonds(anum, aname, coords)
% This function looks for any possible pairs of Nitrogen and Oxygen between
% a distance of 2.6 and 3.2 angstroms. Returns a list containing the pairs
% of atom numbers for hydrogen bonding pairs.
    
    pairs = [];
    name = cellstr(aname);
    nitrogen = [];
    oxygen = [];
    for idx = 1:length(name)
        if name{idx}(1) == 'N'
            nitrogen = [nitrogen idx];
        elseif name{idx}(1) == 'O'
            oxygen = [oxygen idx];
        end
    end
    for ii = 1:length(nitrogen)
        for jj = 1:length(oxygen)
            n_idx = nitrogen(ii);
            o_idx = oxygen(jj);
            d = sqrt((coords(n_idx,1)-coords(o_idx,1))^2 + (coords(n_idx,2)-coords(o_idx,2))^2 + (coords(n_idx,3)-coords(o_idx,3))^2);
            if d > 2.6 && d < 3.2
                pairs = [pairs; [anum(n_idx) anum(o_idx)]];
            end
        end
    end
end