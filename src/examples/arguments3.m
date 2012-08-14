function dummy(arg1, arg2)
if nargin < 2
	arg2 = 0;
end
if nargin < 1
	arg1 = 0;
end
% function body

if ~exist('arg1','var')
	arg1=0;
end

if ~exist('arg1','var') || isempty(arg1)
	arg1=arg1DefaultValue;
end