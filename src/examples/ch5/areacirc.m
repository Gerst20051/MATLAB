function [area, circum] = areacirc(rad)
% This function calculates the area and
% the circumference of a circle
area = pi * rad .* rad;
circum = 2 * pi * rad;