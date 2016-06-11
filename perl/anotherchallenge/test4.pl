#!/usr/bin/perl

use strict;
use warnings;


my $a = "170"; if (chr(($a + $a) % 256) =~ m/[a-z]/i) {  print "damn thing just matched, look!!! ->" . $a . " " . chr(($a + $a) % 256 + 8) . "\n"; }