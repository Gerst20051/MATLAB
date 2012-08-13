fid = fopen( 'output.txt', 'wt' );
fprintf( fid, 'This is the first line of output\n' );
fprintf( fid, '%d + %d = %d\n', 1, 2, (1 + 2) );
fclose( fid );

% OR

fileId = fopen('output.txt','w');
A = rand(300,400);
fwrite( fileId, A, 'double' );
fclose( fileId );