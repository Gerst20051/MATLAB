function [foundIdx, wasFound] = MyBinarySearch( V, toFind )
% Searches a 1D vector V of integers for key value 'toFind'
% returns found index in 'foundIdx' and whether value was successfully
% found or not in 'wasFound'.
% Note:  
%  if 'wasFound' == true then foundIdx is the index of the found element
%  else 'wasFound' == false then foundIdx is the index of the largest
%  element just below the query value 'toFind'.  IE, you could easily
%  insert toFind in the array just above this position as follows
%  Vnew = [V(1:foundIdx) toFind V(foundIdx+1:end)]

% Initialize initial range to everything in vector
n = length(V);
low  = 1;  
high = n; % toFind in V(low+1:high)

% Play the guessing game
while low < high
   mid = ceil((low+high)/2);  % Guess middle of current range
   if V(mid) <= toFind        % Get hint, was it higher or lower ???
     low = mid;               % hint = Higher, go to upper half of range
   else
     high = mid-1;            % hint = Lower, go to lower half of range
   end
end

foundIdx = high;  % Get found index

% But, did we actually find the requested element ???
if (V(foundIdx) == toFind)
    wasFound = true;   % We found it !!!
else
    wasFound = false;  % Didn't actually find it ...
    % The element was not found, it must not exist in the sorted list.
    % however, foundIdx is the index of the closest element 
    % just below the requested element.
    %
    % In other words,
    % if we wanted to add this element to the current sorted array
    % we would put it in the gap (or hole) between the element 
    % at V(foundIdx) and the element at V(foundIdx + 1).
end

