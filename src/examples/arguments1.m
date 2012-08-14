function y = arguments1(a,b,opt1,opt2,opt3)
% Some function with 2 required inputs, 3 optional.

% Check number of inputs.
if nargin > 5
    error('myfuns:arguments1:TooManyInputs', ...
        'requires at most 3 optional inputs');
end

% Fill in unset optional values.
switch nargin
    case 2
        opt1 = eps;
        opt2 = 17;
        opt3 = @magic;
    case 3
        opt2 = 17;
        opt3 = @magic;
    case 4
        opt3 = @magic;
end