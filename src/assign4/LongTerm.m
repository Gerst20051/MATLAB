function [rate] = LongTerm( days, hours )
% This function LongTerm computes the cost of parking depending on how long
% you stay.


%% Validate User Input

if days > 180 | days < 0
    error('Invalid Days Entry: between 0 and 180 exclusive');
end
if hours >= 24 | hours < 0
    error('Invalid Hours Entry: between 0 and 24 inclusive');
end


%% Calculate Rate

% Solve Weeks / Days
weeks = floor(days / 7);
weekdays = days - (weeks * 7);

rate = 49 * weeks;
rate = rate + (7 * weekdays);

% Solve Hours
hours = ceil(hours);
if hours >= 2
    rate = rate + 2;
    if hours >= 3
        rate = rate + hours;
    end
end

end