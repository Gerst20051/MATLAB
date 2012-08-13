function [result] = f1( x )
    if x < 0
        result = x;
    elseif 0 <= x && x < 3 % Note: must make each comparison separately
        result = 2 * x;
    else
        result = 3 * x - 3;
    end
end