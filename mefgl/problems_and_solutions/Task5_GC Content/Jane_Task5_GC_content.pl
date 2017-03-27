#!/usr/bin/perl
# GC_content.pl
use strict; use warnings;

#die "Usage: GC_content.pl <file>\n" if (@ARGV != 1);

my $filename = "rosalind_gc.txt";
my $seq = "";
my @letters;
my $gccount = 0;
my $totalcount = 0;
my $gccontent = 0;

open (my $in, "<$filename") or die "Can't open $filename\n";

while ($seq = <$in>) {
   	 chomp;
   	 if (/^>/) {
		if (length($seq) > 0) {
			@letters = split(//, $seq);
			foreach my $i (@letters) {
				if (lc($i) =~ /[a-z]/) {
				   my $totalcount++;
				}
				if (lc($i) eq "g" || lc($i) eq "c") {
	 				$gccount++;
				}
			}
		if ($totalcount > 0) {
			$gccontent = (100 * $gccount) / $totalcount;
   			}
    		else {
			$gccontent = 0;
    			}
		}
	}
}
print "$gccontent\n";

##get "Use of uninitialized value $_ in scalar chomp at Task5_GC_content.pl line 17, <$in> line 121." as error message. 
Use of uninitialized value $_ in pattern match (m//) at Task5_GC_content.pl line 18, <$in> line 121.


