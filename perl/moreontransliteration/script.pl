#!/usr/bin/perl

use strict;
use warnings;


print "a b c" =~ tr/a-z/c-z/r . "\n";
   #   C D E        1*  2*     
   #   		    1*all from a to z
   #   		    2*second letter from a will be c, so all processed letters will follow this order till letter z which is last defined.
