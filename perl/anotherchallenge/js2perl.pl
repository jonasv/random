#!/usr/bin/perl
#
#
use strict;
use warnings;

#dont look , dont ask
#function(ascii,a,b,c) {
#			for(i=0;i<ascii.length;i++) {
#				if(i%3==0) {
#					ascii[i]=(ascii[i]+a)%256;
#				}
#				if(i%3==1) {
#					ascii[i]=(ascii[i]+b)%256;
#				}
#				if(i%3==2) {
#					ascii[i]=(ascii[i]+c)%256;
#				}
#			}
#			return ascii;
#		}	

my @ascii = '0';
#my $a = '0';
#my $b = '0';
#my $c = '0';
my $i = '0';

sub dec2bin {
    my $str = unpack("B32", pack("N", shift));
    $str =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros
    return $str;
a}

sub process {
	my ($ascii,$a,$b,$c) = @_;
	for ($i=0;$i<length($ascii);$i++) {
		#print "$ascii $a $b $c \n";
		if ($i % '3' == '0') {
			$ascii[$i] = ($ascii[$i] + $a) % '256';
			#print "1 \n";
		}
	#print $ascii[$i] . "\n";
	#printf "%b\n", $decimal;
	#sprintf("%c", $ascii)
	print $ascii;
	}
}

process('42','246','181','78');


#42 246 181 78


