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


# for (my $i=0; $i <= 5; $i++) {
open("handle", 'numbers.txt') or die('unable to open numbers file\n');

#$/ = ' ';
#foreach (my $line; $line <=256; $line++) (<NUMBERS>) {
#foreach my $line (<file>) {
#	chomp $line;
#	print $line;
#}



my $timestorun = 1;
while ($timestorun <= 5) {
    foreach my $line (<handle>) {
	chomp $line;
	$line += 1;
	print "$line ";
    }
    $timestorun++;
    
}
    
    
#my $timestorun = 1;
#while ($timestorun <= 5) {
#    foreach my $line (<handle>) {
#	chomp $line;
#	$line += 1;
#	print "$line ";
#    }
#    $timestorun++;
#}



#foreach (my $line = 0; $line <=5; $line++) {
#    foreach my $file (<handle>) {
#	chomp $line;
#	print $line . " ";
#	last;
#    }
#    next;
#}

close("handle");
