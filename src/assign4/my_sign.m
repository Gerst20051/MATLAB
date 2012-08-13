function [result] = my_sign( x )
	% returns {-1,0,+1} depending if x is negative, zero, or positive.
    if x < 0
        result = -1; % negative x, sign(x) = -1
    elseif x > 0
        result = +1; % positive x, sign(x) = +1
    else % by process of elimination ...
        result = 0; % x must be zero, sign(x) = 0
    end % end the "if" statement
end % end the function declaration