mymat = rand(2,3)
save testfile.dat mymat -ascii
type testfile.dat
mymat = rand(3,3)
save testfile.dat mymat -ascii -append

clear
load testfile.dat
who
testfile