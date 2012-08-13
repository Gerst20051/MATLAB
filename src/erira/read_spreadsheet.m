A = xlsread('myExample.xlsx');
subsetA = xlsread('myExample.xlsx', 1, 'B2:C3');
[ndata, text, alldata] = xlsread('myExample.xlsx');