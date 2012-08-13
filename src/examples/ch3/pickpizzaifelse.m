% This script asks the user for a type of pizza
% and prints which type to order using if-else
mypick = menu('Pick a pizza','Cheese','Shroom','Sausage');
if mypick == 1
	disp('Order a cheese pizza')
elseif mypick == 2
	disp('Order a mushroom pizza')
elseif mypick == 3
	disp('Order a sausage pizza')
else
	disp('No pizza for us today')
end