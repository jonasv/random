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

#

sub readnumbers {
    open(NUMBERS, 'numbers.txt') or die('unable to open numbers file\n');
    $/ = ' ';
    foreach(<NUMBERS>) {
	print "$_ \n";
    }
    close(NUMBERS);
}

my @ascii = '0';
my $i = '0';

sub process {
	my ($ascii,$a,$b,$c) = @_;
	for ($i=0;$i<length($ascii);$i++) {
		#print "$ascii $a $b $c \n";
		if ($i % '3' == '0') {
			$ascii[$i] = ($ascii[$i]+$a)%256;
		}
	return $ascii;
	}
}

process('42','246','181','78');


