function y = arguments2(a,b,varargin)
% Some function that requires 2 inputs and has some optional inputs.

% only want 3 optional inputs at most
numvarargs = length(varargin);
if numvarargs > 3
    error('myfuns:arguments2:TooManyInputs', ...
        'requires at most 3 optional inputs');
end

% set defaults for optional inputs
optargs = {eps 17 @magic};

% now put these defaults into the valuesToUse cell array, 
% and overwrite the ones specified in varargin.
optargs(1:numvarargs) = varargin;
% or ...
% [optargs{1:numvarargs}] = varargin{:};

% Place optional args in memorable variable names
[tol, mynum, func] = optargs{:};