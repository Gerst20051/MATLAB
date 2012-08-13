function [result] = f2( x )
    result = x; % All results have at least one "x" in them
        if x > 0
        % All results with x greater than 0 have at least "2x" in them,
        % so add "x" to the current result to get x + x == 2 * x
        result = result + x;
        end
        if x >= 3 % Note: this is a new 'if' statement, separate from above
        % If x >= 3, then x > 0, which means the above "if" statement must
        % have executed, so "result" currently contains 2 * x. To get
        % 3 * x – 3, we therefore only need to add x – 3 to result!
        result = result + x - 3;
    end
end