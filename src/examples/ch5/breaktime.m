function [hours, minutes, secs] = breaktime(totseconds)
% This function breaks a total number of seconds into
% hours, minutes, and remaining seconds
hours = floor(totseconds/3600);
remsecs = rem(totseconds,3600);
minutes = floor(remsecs/60);
secs = rem(remsecs,60);