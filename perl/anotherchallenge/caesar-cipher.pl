#!/usr/bin/perl
# caesar-cipher.pl - Illustrates the use of
# Caesar Cipher as well as common approaches of
# breaking it.
#
# Author: iphelix
use strict;
if(@ARGV) {
   # Encode the message given the shift value
   if($ARGV[0] eq "-e" && $ARGV[2]) {
      print "Ciphertext:\n";
      foreach (split(//,uc($ARGV[1]))) {   
         print chr(65+(ord($_)-65+$ARGV[2])%26);
      }
      print "\n";
   }
   
   # Decode the message
   elsif($ARGV[0] eq "-d") {
         print "Plaintext:\n";
         foreach (split(//,uc($ARGV[1]))) {   
            print lc(chr(65+(ord($_)-65-$ARGV[2])%26));
         }
         print "\n";
   }
   
   # For larger strings apply statistical analysis
   elsif($ARGV[0] eq "-d1") {
         print "Trying to count letter frequencies...";
         my %freq;
         my ($max_letter, $max_frequency);
         foreach (split(//,uc($ARGV[1]))) {
            $freq{$_} = $freq{$_} + 1;
            if($freq{$_} > $max_frequency) {
               $max_letter = $_;
               $max_frequency = $freq{$_};
            }
         }
         # Compare with the most frequent letter E
         my $shift = ord($max_letter)-ord('E');
         print "guessing a shift of $shift\n";
         print "Plaintext:\n";
         foreach (split(//,uc($ARGV[1]))) {   
            print lc(chr(65+(ord($_)-65-$shift)%26));
         }
         print "\n";
    }
    
    # Brute force shorter strings
    else {
         print "Brute Forcing...\n";
         for my $shift (1..26) {
            print "[$shift] ";
            foreach (split(//,uc($ARGV[1]))) {   
              print lc(chr(65+(ord($_)-65-$shift)%26));
            }
            print "\n";
         }
    }
} else {
print "Caesar Cipher Encoder/Decoder\n";
print "=============================\n";
print "Usage:\n";
print " -e encode_message shift\n";
print "    no spaces are allowed in plaintext message.\n";
print " -d decode_message shift\n";
print " -d1 decode_message\n";
print "    try simple frequency analysis to determine the shift\n";
print " -d2 decode_message\n";
print "    brute force method relying on users to find plaintext\n";
}

