#!/usr/bin/perl

OUTER_LOOP: for ($a = 0; $a < 2; $a++) {
                for ($b = 0; $b < 2; $b++) {
                    print("inner: $a,$b\n");
                   	for ($c = 0; $c < 2; $c++) {
                   	    if ($c == 1) {
                    		next OUTER_LOOP;
                    	    }
                	}
                }
                print("outer: $a,$b\n");
            }

