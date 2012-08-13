%% Idioms
% Common patterns of problems that we want to solve

% Assignment (of a scalar)
% O(1) time
a = 1;
b = 7;

% Swap Idiom, swap the values of two elements
  % We want to swap the values of two scalar variables
  % Without losing any value in the process

% Note:  MATLAB doesn't have a swap function that I could find...

% 1st Attempt, doesn't work
a = b;          % a gets the right value,
b = a;          % but b gets the wrong value, 'a's old value was lost...

% Try again, we need another place holder variable to store 
% the value of a before it gets destroyed

% Restore 'a' and 'b'
a = 1;
b = 7;

% 2nd Attempt to swap, correct solution
% takes O(1) time
saveA = a;    % Save value of 'a' away first
a = b;        % 'a' gets b's value
b = saveA;    % 'b' gets a's saved value
  


%% Linear Iterative Idioms
% Assume that we have a vector V with 
% n = length(V) elements in it.
%
% In each Example:  We will first show how to solve it using
% 'for' loops and then using Vectorization, IE using MATLAB commands
% 
% The Matlab commands themselves at some low level
% are still using some kind of looping logic to 
% accomplish these common tasks
%
% 
%   1st) - The MATLAB functions are very carefully written for 
%          correctness, robustness, and speed.  Typically
%          much better than we can come up with ourselves...
%          IE they work !
%
%   2nd) - MATLAB build-in functions are already compiled 
%          Compiled code is faster than interpreted code (say 10x)
%
%   3rd) - Less overhead, each function call has a certain amount
%          of overhead in invocation, setup, and validation.   
%          Calling a function once for an entire vector of elements
%          is more efficient than calling a function each time
%          for every individual element in the vector.
%
%    CostVectorCall  = 1*Overhead + n*operation
%    CostElemByElemCall = n*Overhead + n*operation
%
%    CostElemByElemCall > CostVectorCall
%          
% Once you have a correct working solution, for any idiom
% You should hang on to it. As you will probably need it again !!!

%% Create a random vector of integers in range [1,1000]
%

% Use a very large vector for performance profiling
n = 100000;  % 100 thousand elements

% Create a Vector, Solution #1
   % Poor performance Solution
   % Regrow array on each iteration through loop
tic;
V = [];  % set to empty array
for idx = 1:n;
    V(idx) = int16(ceil(rand * 1000)); 
end
elapsed1 = toc

% took 10.5977 seconds on my computer

% Create a Vector, Solution #2
% Pre-allocate array of correct size
n = 1000000;  % Change to 1 million elements

tic;
V = zeros(1,n);  % set to empty array
for idx = 1:n;
    V(idx) = int16(ceil(rand * 1000)); 
end
elapsed2 = toc

% took 0.0508 seconds on my computer
% 10 times as much data handled
% and still 20x faster


% Create a Vector, Solution #3
% Faster, let MATLAB do the work...
n = 1000000;  % Change to 1 million elements
tic;
V = int16(ceil(rand(1,n)*1000));
elapsed3 = toc

% took 0.0253 seconds on my computer
% MATLAB command about 2x faster than doing it myself
vOrig = V;


%% Copy a Vector
%

% COPY, Fast MATLAB solution
tic 
vCopy = V;
elapsed1 = toc

% COPY, do it ourselves via a LOOP...
n = length(V);
tic 
vCopy = zeros(1,n);
for idx = 1:n;
    vCopy(idx) = V(idx);
end
elapsed2 = toc


%% Sum all values in a vector

% SUM, via MATLAB
tic;
total = sum( V );
elapsed1 = toc

% SUM, do it ourselves ...
tic;
total = 0;   % Why do we need to set it zero to start?
for idx = 1:n;
    total = total + V(idx);
end
elapsed2 = toc

%% Find Minimum value in a Vector
%

% MIN, via MATLAB
[minVal, minIdx] = min(V);

% MIN, Our Solution...
minVal = V(1);
minIdx = 1;
for idx = 2:n
    if V(idx) < minVal
        minVal = V(idx);
        minIdx = idx;
    end
end

%% Counting in a Vector
%

% Count the number of occurences of 23 in a vector
toFind = 23;

% COUNT, via MATLAB
myCount = sum( V == toFind );

% COUNT, Our Solution
currCount = 0;
for idx = 1:n
    if (V(idx) == toFind)
        currCount = currCount+1;
    end
end


%% Finding in a vector
%

% Find first 23 in a vector
toFind = 23;

% FIND, via MATLAB
findAll      = find( V == toFind );
findFirstIdx = findAll(1);

% OR, in MATLABL
findFirstIdx = find( V == toFind, 1 );

% FIND, our solution
for findFirstIdx = 1:n
    if (V(findFirstIdx) == toFind)
        break;  % Skip out of loop, we found the first value
    end
end

% What if we want to find the next occurence ?
findStartIdx = findFirstIdx+1;  % Move past first idx
for findNextIdx = findStartIdx:n
    if (V(findNextIdx) == toFind)
        break;  % Skip out of loop
    end
end

% in MATLAB
findAll = find( V == toFind );
findNextIdx = findAll( 2 );
nextNext = findAll( 3 );


%% Find all elements in a Range
% or meeting a condition

% Find all elements in range [23, 117]
startRange = 23;
endRange = 117;

% FIND in Range, MATLAB solution
findAll = find( (startRange <= V) & (V <= endRange) );

% FIND in Range, our solution
found = zeros(1,n);
count = 0;
for findIdx = 1:n
    if (startRange <= V(findIdx)) && (V(findIdx) <= endRange)
        found(count+1) = V(findIdx);
        count = count + 1;
    end
end
found = found(1:count); % Resize found array to actual size


%% COUNT Number of unique integers in vector
%

n = 1000;
V = int16( ceil( rand( n, 1 ) * 1000 ) );

% COUNT DISTINCT via MATLAB
countDistinct = length(unique(V));
% OR
%count = hist(V,1:max(V));  % Note: only works on single, double data types
%countDistinct = sum(count > 0);

% COUNT DISTINCT, our solution
m = max(V);
countArray = zeros(1,m);  % array of counts for each unique number

% 1st Loop to get counts for each number
for idx = 1:n
    % Indirection, use value of V(idx) as index into countArray
    countArray(V(idx)) = countArray(V(idx)) + 1;
end
% 2nd loop to count up number of distinct values
% from countArray, any non-zero entry should be counted
countDistinct = 0;
for idx = 1:m
    if (countArray(idx) > 0)
        countDistinct = countDistinct + 1;
    end
end

%% SWAPPING an entire vector

% Create another vector to swap with V
n = length(V);
U = ceil(rand(1,n)*1000);

% MATLAB, swap the two vectors
temp = V;
V = U;
U = temp;

% SWAP, our solution, swap element by element
for idx = 1:n
    % swap, element by element
    temp = V(idx);
    V(idx) = U(idx);
    U(idx ) = temp;
end
    
    
%% SORTING and SEARCHING IDIOMS

%% SORTING
% SORTING reorders an array into sorted order
%    Takes O(n log n) time for well-written sorts
%    Takes O(n^2) time for naive sort algorithms

% A naive sort routine takes O(n^2) time
% IE The algorithm grows quadratically

% The best sort routines 
%    QuickSort, Heapsort, MergeSort, IntroSort
% take O( n log n ) time
% IE it grows in log linear time.  
%
% O(n log n) is actually an lower bound on any sorting algorithm that
% requires comparing two elements at a time.
%
% IE O(n log n) is the best you can do for sorting as long
% as pairwise comparisions are involved.

% Note:  The post office achieves linear time O(n) in delivering 
%        everyones mail.  How?
%
%   Answer: They don't actually sort your mail in a computational sense
%   even though this is the term that is often used to describe the 
%   process...   
%
%   IE They don't compare letters to other letters being delivered
%   that day, in order to organize them...
%
%   Instead, they BIN (or Bucketize) your mail...
%   They are comparing addresses to buckets...
%   not letters to letters...
%
%   How does this work?
%      They compare your letters to desination bins (or buckets)...
%      1st) Your local post-office bins your outgoing
%           mail by zip-code and sends it to the 
%           appropriate regional post-office
%      2nd) The local post-office bins all their incoming
%           mail by route, and puts it in a bucket
%           belonging to your mail man (or woman).
%      3rd) Your mail man (or woman) bins (sorts) all the mail by 
%           destination along his route.  As he drives along his/her route
%           he pulls out all the mail for the next destination and puts
%           it in the correct mailbox.
%  
%  Each of the above bucket sorts take linear time O(n)
%  3 buckets sorts still counts as total linear time O(n) as 
%  constant factors like '3' don't matter from a Big 'O' point of view...
%
% Note:  Sort routines are very tricky to get right...
%        It is quite hard to write sorting code that works correctly
%
% You should definitely hang out to any sort routines that 
% you write yourself, once you get them working correctly...

% MATLAB solution
vSorted = sort( V );  % defaults to ascending order

% Selection Sort - takes O(n^2) time, IE quadratic time to sort
n = length(V); 
W = V; 
for iIdx = 1:(n-1)
   for jIdx = (iIdx+1):n   % note i < j always,
     if W(iIdx) > W(jIdx)  % want W(i) <= W(j)
       temp = W(iIdx);     % swap idiom
       W(iIdx) = W(jIdx);
       W(jIdx) = temp;
     end
   end
end

% Merge Sort - takes O(n log n) time
% Sort vector 'x' using the merge sort algorithm
% result is a vector consisting of the sorted values of 'x' 
% in ascended order.
% See MyMergeSort.m for details...
Z = MyMergeSort( V );

% Note: This version of MergeSort is very inefficient because
%       of the need to copy by value for parameter passing


%% Searching
% SEARCHING allows us to find elements in an array
%    Searching on Unsorted Arrays
%    Takes Linear time O(n) 
%    Worst case, element is not in array but we don't
%                know that until we have looked at
%                every element in the array.
%    Searching on Sorted Arrays,
%    Takes log(n) time.  

%  Consider the 'guess a number between 1 and 100 game...'

%  I could naively guess 1 then 2 then 3 until I found your number
%  This approach is correct and works but it is much slower than
%  the technique most people use.  

%  Most people use a binary search technique, dividing the
%  possible range of numbers to consider in half on each guess
%
%  This technique relies on getting a 'higher' or 'lower' hint
%  after each guess to help guide the next guess.

%   IE if I secretly picked the number 39 as my answer
%
%   You might guess 50, I would say 'lower'
%   You might guess 25, I would say 'higher'
%   You might guess 37, I would say 'higher'
%   You might guess 44, I would say 'lower'
%   You might guess 40, I would say 'lower'
%   You might guess 38, I would say 'higher'
%   You would say it must be 39 and I would say 'You got it'

toFind = V(123);  % Exists in Array
% toFind = -100;    % Doesn't Exist in array

% Linear Search, via MATLAB 
findAll = find( V == toFind );
foundIdx = findAll(1);

% Linear Search, our Solution
found = false;
foundIdx = 0;
for (idx = 1:n)
    if V(idx) == toFind
        % Found it, leave loop early
        found = true;
        foundIdx = idx;
        break;  
    end
end



% Binary Search

% Strangely, MATLAB doesn't have any binary
% search functionality that I could find...

% Make sure we start with a sorted array
U = sort(V);

% Pick a value we know is in array
toFind = V(123);
[foundIdx, found] = MyBinarySearch( U, toFind );

% Pick a value we know is not in array
toFind = -100;

[foundIdx, found] = MyBinarySearch( U, toFind );




%% Recursion Example
% Calculating power of a number recursively
x = int32(2);
y = int32(27);

% In MATLAB
x1 = x^y;

% in Iterative Manner, takes O(n) time
x2 = 1;
multCount = 0;  % count number of multiply operations
for idx = 1:y
  x2 = x2 * x;
  multCount = multCount + 1;
end

% Call a Recursive Function to do multiplication
% in a divide and conquer manner.
% takes O( log n ) time 
x3 = MyPower( x, y );














