#!/usr/bin/perl


open("handle", 'numbers.txt') or die('unable to open numbers file\n');
#my $timestorun = 1;
#while ($timestorun <= 5) {
    # first
#    foreach my $line (<handle>) {
#	# second
#	chomp $line;
#	    $line += 1;
#	print "$line ";
#    }#end
#    $timestorun++;
#}#end
#close(handle);



my $timestorun = 1;
while ($timestorun <= 5) {
    foreach my $line (<handle>) {
      chomp $line;
        $line += 1;
          print "$line ";
              }
                  $timestorun++;
                  
                  }