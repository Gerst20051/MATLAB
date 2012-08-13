s2 = 'How much wood would a woodchuck chuck?';
s4 = s2(length(s2):-1:1);

% OR

s4 = s2;
n = length(s4);
for i = 1:n/2
    t = s4(i);
    s4(i) = s4(n – i + 1);
    s4(n – i + 1) = t;
end