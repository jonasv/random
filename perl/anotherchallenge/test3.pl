#!/usr/bin/perl
use strict;
use warnings;

#my $list1 = "184 86 71 220 96 7 144 52 74 222 88 77 209 101 80 220 82 79 217 96 73 227 17 65 223 99 251 227 96 71 230 90 73 215 17 79 216 86 251 183 82 72 210 90 79 144 84 67 209 93 71 213 95 66 213 31 251 192 93 64 209 100";
#my $list2 = "64 144 100 64 222 85 251 233 96 80 226 17 78 223 93 80 228 90 74 222 17 60 222 85 251 179 71 251 228 96 251 217 84 60 222 84 74 212 86 27 215 82 72 210 90 79 226 86 78 213 82 77 211 89 9 211 96 72 144 98 80 223";
#my $list3 = "101 68 222 88 251 226 86 65 213 99 64 222 84 64 170 17 17 169 84 61 167 39 19 167 87 12 158";
my $biglist = "184 86 71 220 96 7 144 52 74 222 88 77 209 101 80 220 82 79 217 96 73 227 17 65 223 99 251 227 96 71 230 90 73 215 17 79 216 86 251 183 82 72 210 90 79 144 84 67 209 93 71 213 95 66 213 31 251 192 93 64 209 100 64 144 100 64 222 85 251 233 96 80 226 17 78 223 93 80 228 90 74 222 17 60 222 85 251 179 71 251 228 96 251 217 84 60 222 84 74 212 86 27 215 82 72 210 90 79 226 86 78 213 82 77 211 89 9 211 96 72 144 98 80 223 101 68 222 88 251 226 86 65 213 99 64 222 84 64 170 17 17 169 84 61 167 39 19 167 87 12 158";



my @num = split(" ", $biglist);

#foreach (0 .. 255) {
#	foreach (@num) {
#	    if (chr(($_ + $_) % 256) =~ m/[a-z]/) {
#		print chr(($_ + $_) %256 + 8);
#	    }
#	}
#}

#my $a = $_;
#my $b = $_;


#foreach (@num) {
#    print $_;
#}


       foreach (@num) {
       my $x = $_;
	print  chr(($x) % 256);
	}
           if (chr(($a) % 256) =~ m/[a-z]/i) {
               print $a . " ->" . chr(($a + $a) % 256 + 8) . "\n";
           }
       }
	print "\n";
