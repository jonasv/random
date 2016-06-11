#!/usr/bin/perl

# Copyright 2011- Christopher M. Frenz
# This script is free software it may be used, copied, redistributed, and/or modified
# under the terms laid forth in the Perl Artisic License

open(INPUT, "<DraculaEncrypted.txt");
open(OUTPUT, ">DraculaDecrypted.txt");

$shift=7;

while(<INPUT>){
$text=$_;
$text =~ s/\r?\n$//;
@characters=split(//, $text);
$string="";

foreach $character(@characters){
   $asciinum=ord($character);
   if(($asciinum-$shift)>=32){
      $string=$string . chr($asciinum-$shift);
   }
   else{$string=$string . chr($asciinum-$shift-32+127)}
}

print OUTPUT "$string\n";
}

close INPUT;
close OUTPUT;
