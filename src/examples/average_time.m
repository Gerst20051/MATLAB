REPS = 1000;   minTime = Inf;   nsum = 10;
tic;

for i=1:REPS
   tStart = tic;   total = 0;
   for j=1:nsum, 
      total = total + besselj(j,REPS);
   end

   tElapsed = toc(tStart);
   minTime = min(tElapsed, minTime);
end
averageTime = toc/REPS;