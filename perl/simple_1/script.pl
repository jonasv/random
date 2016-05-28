#!/usr/bin/perl

# In a language of your choice (not BASH), take all lines of a given file with a digit in them and move them to the end of the file.
use strict; #default :P


open(DATA_read, '</root/programming/perl/simple_1/data') or die; #open filehandle for reading
open(DATA_write, '>>/root/programming/perl/simple_1/data') or die; #open filehandle for writting, because its must painless than to use +>> with seek() ....

while (<DATA_read>) { #read file..

	if ($_ =~ m/(\d+)/) { #.. then if there is a diggit
		print DATA_write $_; # .. then append those lines with digits to the same file
	}
}
print "0\n";
close(DATA_read);
close(DATA_write); 
#finally close both filehandles and print exit status 0

