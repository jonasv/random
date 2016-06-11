#!/usr/bin/perl


use strict;
use warnings;


open("handle", 'numbers.txt') or die('unable to open numbers file\n');
while(<handle>) {
    chomp;
    print "$_\n";
    my @split = split;
    my $count = 0;
    for (1..256){
        $count++;
        foreach (@split){ 
            my $num = $_ + $count;
            print chr "$num";
        }
        print "\n";
    }

}

close("handle");