clear all; close all;

try
	load('response_timer_data.mat');
catch exception
	A = [];
end

numrows = length(A(:,1));
questions = 1:length(A(1,:));
males = 1:2:numrows;
females = 2:2:numrows;

hold on

% Plot Question Averages (Male)
male_averages = sum(A(males,:)) / length(males);
plot(questions, male_averages, '.b', 'markersize', 20);

% Plot Question Averages (Female)
female_averages = sum(A(females,:)) / length(females);
plot(questions, female_averages, '.m', 'markersize', 20);

% Plot Individual Times (Male)
plot(questions, A(males,:), '.b');

% Plot Individual Times (Female)
plot(questions, A(females,:), '.m');

% Plot Overall Average (Male)
male_average(1:length(questions)) = sum(male_averages) / length(questions);
plot(questions, male_average, '-b');

% Plot Overall Average (Female)
female_average(1:length(questions)) = sum(female_averages) / length(questions);
plot(questions, female_average, '-m');

% Plot Labels
title('Gender vs. Response Time | Male (blue) - Female (magenta)');
xlabel('Question');
ylabel('Response Time (sec)');