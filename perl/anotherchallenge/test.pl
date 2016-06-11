#!/usr/bin/perl

use strict;
use warnings;

open("handle", 'numbers.txt') or die('unable to open numbers file\n');

for my $line (<handle>) {
    chomp $line;
    for my $number (split /\s+/, $line) {
        for (my $a = $number; $a < $number+5; $a++) {
            print "$a ";
        }       
        print "\n";
    }
}
close("handle");
