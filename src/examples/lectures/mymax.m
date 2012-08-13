function [themax] = mymax(thevector)
    currmax = thevector(1);
    for index = 1:length(thevector)
        if thevector(index) > currmax
            currmax = thevector(index);
        end
    end
    themax = currmax;
end