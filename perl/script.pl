#!/usr/bin/perl

# In a language of your choice (not BASH), take all lines of a given file with a digit in them and move them to the end of the file.
use strict;


open(DATA_read, '</root/programming/perl/data') or die;
open(DATA_write, '>>/root/programming/perl/data') or die;

while (<DATA_read>) {

	if ($_ =~ m/(\d+)/) {
		#print "$_";
		print DATA_write $_;
	}

}

close(DATA_read);
 
