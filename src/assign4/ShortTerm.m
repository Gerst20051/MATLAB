function [rate] = ShortTerm( days, hours, minutes )
% This function ShortTerm computes the cost of parking depending on how long
% you stay.


%% Validate User Input

if days > 60 | days < 0
    error('Invalid Days Entry');
end
if hours >= 24 | hours < 0
    error('Invalid Hours Entry');
end
if minutes >= 60 | minutes < 0
    error('Invalid Minutes Entry');
end


%% Calculate Rate



end