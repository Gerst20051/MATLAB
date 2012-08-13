function loopC(c0,c1,j0)
 
j = j0;
 
for i = c0:c1
   if ( j > c1 )
       break;
    end

    while ( j < i )
        disp( [ i j ] );
        j = j + 1;
    end
end