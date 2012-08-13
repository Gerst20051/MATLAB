function ret = countTextLines(fileIn,fileOut)
nr = 0; ret = 0;
[fin msg] = fopen(fileIn,'rt');
if fin == -1, fprintf('Could not open in file: %s\n',msg), return, end;
[fout msg] = fopen(fileOut,'wt');
if fout==-1, fprintf('Could not open out file: %s\n',msg), return, end;

textLine = fgetl(fin);
while textLine ~= -1
   nr = nr + 1;
   textLine = fgetl(fin);
end
fclose(fin);
fclose(fout);

fprintf('Number of lines %s\n', nr);
ret = nr;