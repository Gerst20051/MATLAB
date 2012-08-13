%% Series 1

x = [4];

for i = 2:1000
    x(i) = ((2 + cos(i-1)) / sqrt(i-1)) * x(i-1);
end

plot(x);


%% Series 2 (#1 w/ Absolute Value)

x = [4];

for i = 2:1000
    x(i) = abs(((2 + cos(i-1)) / sqrt(i-1))) * x(i-1);
end

plot(x);


%% Series 3

x = [];

for n = 1:30
    x(n) = (-1)^(n-1) * (5^n/n^7);
end

plot (x);


%% Series 4 (#3 w/ Absolute Value

x = [];

for n = 1:30
    x(n) = abs(5^n/n^7);
end

plot (x);
