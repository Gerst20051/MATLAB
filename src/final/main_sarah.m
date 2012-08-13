% Final Project: Andrew Gerst, Sarah Levine

clear all; close all;

try
	load('survey_data.mat');
catch exception
	A = [];
end
%% Abstract


%BLAHBLAHBLAH


%% Separating Male and Female Data
[r,c] = size(A);
maleControl = [];
maleExperimental = [];
femaleControl = [];
femaleExperimental = [];
for idx = 1:r
    if A(idx,1) == 0
        maleControl = [maleControl; A(idx,2:6)];
        maleExperimental = [maleExperimental; A(idx,7:c)];
    else
        femaleControl = [femaleControl; A(idx,2:6)];
        femaleExperimental = [femaleExperimental; A(idx,7:c)];
    end
end

femaleAll = [femaleControl,femaleExperimental];
maleAll = [maleControl,maleExperimental];

%% Statistical Analysis

%Average time taken per question for each gender:
%   *Male
%       - Control Section
            maleAverage_Cont = mean(sum(maleControl,2)/5)
%       - Experimental Section
            maleAverage_Exp = mean(sum(maleExperimental,2)/10)
%   *Female
%       - Control Section
            femaleAverage_Cont = mean(sum(femaleControl,2)/5)
%       - Experimental Section
            femaleAverage_Exp = mean(sum(femaleExperimental,2)/10)

            
            
%Average time taken on each individual question by gender:
%   *Male
       maleAverage_Ind = mean(maleAll)
%   *Female
       femaleAverage_Ind = mean(femaleAll)     
    
     
     
%Standard deviations for male and female response times:
%   *Male
%       - Control Section
            maleStd_Cont = std(sum(maleControl,2)/5)
%       - Experimental Section
            maleStd_Exp = std(sum(maleExperimental,2)/10)
%   *Female
%       - Control Section
            femaleStd_Cont = std(sum(femaleControl,2)/5)
%       - Experimental Section
            femaleStd_Exp = std(sum(femaleExperimental,2)/10)

   
     
     
%Median response times for males and females:
%   *Male
%       - Control Section
            maleMedian_Cont = median(sum(maleControl,2)/5)
%       - Experimental Section
            maleMedian_Exp = median(sum(maleExperimental,2)/10)
%   *Female
%       - Control Section
            femaleMedian_Cont = median(sum(femaleControl,2)/5)
%       - Experimental Section
            femaleMedian_Exp = median(sum(femaleExperimental,2)/10)

%% Graphical Analysis

% Bar Graph of Average Response Times for Each Question (1-16) by Gender:
bar([maleAverage_Ind;femaleAverage_Ind]')
title('Average Response Times for Individual Questions by Gender')
xlabel('Question Number')
ylabel('Average Response Time (sec)')
legend('Male','Female')

% Box and Whisker Plots of Average Time Taken per Question:
figure;
boxplot([sum(femaleControl,2)/5',sum(femaleExperimental,2)/10'])
title('Distribution of Completion Times for Female Respondents')
xlabel('Control Group = 1, Experimental Group = 2')
ylabel('Average Time Taken per Question(sec)')

figure;
boxplot([sum(maleControl,2)/5',sum(maleExperimental,2)/10'])
title('Distribution of Completion Times for Male Respondents')
xlabel('Control Group = 1, Experimental Group = 2')
ylabel('Average Time Taken Per Question (sec)')


%% Conclusion

%BLAHBLAHBLAH
