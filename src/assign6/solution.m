% Solution to Assignment 6: Andrew Gerst

clear all; close all;


%% Function Descriptions

%% readPDBfile Function
% This function reads the atoms for a protein and returns their serial
% number, atom name, and coordinates.

type readPDBfile


%% potentialHbonds Function
% This function looks for any possible pairs of Nitrogen and Oxygen between
% a distance of 2.6 and 3.2 angstroms. Returns a list containing the pairs
% of atom numbers for hydrogen bonding pairs.

type potentialHbonds


%% drawAtoms Function
% This function plots any atoms with aname matching the queryName.

type drawAtoms


%% Protein 7HVP

[anum aname coords] = readPDBfile('7HVP.pdb');

% Generate 3D Plot of C atoms
drawAtoms(' C  ', 'g*', aname, coords);

% Output number of hydrogen bonds
pairs = potentialHbonds(anum, aname, coords);
numOfHbondPairs = length(pairs)


%% Protein 1GFL

[anum aname coords] = readPDBfile('1GFL.pdb');

% Generate 3D Plot of C atoms
drawAtoms(' C  ', 'g*', aname, coords);

% Output number of hydrogen bonds
pairs = potentialHbonds(anum, aname, coords);
numOfHbondPairs = length(pairs)