% Open Input and Output Files
fin = fopen( 'my_orig.m', 'rt' );
fout = fopen( 'my_copy.m', 'wt' );

% Read and write each line of text
textLine = fgetl( fin );
while ischar( textLine )
	fprintf( fout, '%s\n', textLine );
	textLine = fgetl( fin );
end

% Close Input and output files
fclose( fout );
fclose( fin );