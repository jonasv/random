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

#sub readnumbers {
#    open(NUMBERS, 'numbers.txt') or die('unable to open numbers file\n');
#    $/ = ' ';
#    foreach(<NUMBERS>) {
#		print chr ($_) . " ";
#    }
#    close(NUMBERS);
#}

#my @ascii = '0';
#my $i = '0';

#sub process {
#	my ($ascii,$a,$b,$c) = @_;
#	for ($i=0;$i<length($ascii);$i++) {
#		#print "$ascii $a $b $c \n";
#		if ($i % '3' == '0') {
#			$ascii[$i] = ($ascii[$i]+$a)%256;
#		}
#	return $ascii;
#	}
#}

#&readnumbers;
#process(&readnumbers);
$/ = ' ';
#my $numbers = "173 18 240 209 28 176 133 240 243 211 20 246 198 33 249 209 14 248 206 28 242 216 205 234 212 31 164 216 28 240 219 22 242 204 205 248 205 18 164 172 14 241 199 22 248 133 16 236 198 25 240 202 27 235 202 219 164 181 25 233 198 32 233 133 32 233 211 17 164 222 28 249 215 205 247 212 25 249 217 22 243 211 205 229 211 17 164 168 3 164 217 28 164 206 16 229 211 16 243 201 18 196 204 14 241 199 22 248 215 18 247 202 14 246 200 21 178 200 28 241 133 30 249 212 33 237 211 20 164 215 18 234 202 31 233 211 16 233 159 205 183 203 14 180 157 18 189 201 225 188 147";

open(NUMBERS, 'numbers.txt') or die('unable to open numbers file\n');

$/ = ' ';






foreach my $line (<NUMBERS>) {
	chomp $line;
	print $line;
}


#foreach my $line (<NUMBERS>) {
#	chomp $line;
#	for (my $i=0; $i <= 5; $i++) {
#	print $line . " ";
#	next;
#	}
#	$line += 1;
#	$line++;
#	next;
#	if ($line == "209") {
#	    exit;
#	}
#}
	#for (1 .. 256) {
	#   print $line . " ";
	#   $line += 1;
	#   $line++;
	#   next;
	#}
	#next;
#}

#	if ($line == "176") {
#	    print " $line has been found ";
#	    exit;
#	}
#	print "$var ";
#	for (1 .. 256) {
#	    $var +=1;
#	    print $var;
#	    if ($_ == "164") {
#		print $. . "<---current line\n";
#	    }
#	}
#	$_ += 151;
#	print chr ($_);
	


#	print $_;
#	$_ += 1;
#	print " " . $_;
#	exit;
#	for (1 .. 256) {
	    #$_ += int(1);
	    #$_++;
	    #print $_ . "\n";
	    #if ($_ = "64") {
		#print chr ($_);
	    #}
	#}
		
#print $_ . "\n";
#	for (1 .. 256) {
#		print chr ($_);
#		$_ +=1;
#	}		
#}

#print "\n";
	close(NUMBERS);