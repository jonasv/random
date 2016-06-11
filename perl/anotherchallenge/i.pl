#!/usr/bin/perl

use strict;
use warnings;

my @num = split(" ",(<DATA>)[0]);  

foreach my $inc (0..$#num)
{
    print map{$inc+$_," "}@num;  # Add one by one in array element
    print "\n";
}


__DATA__
1 2 3 4 5
