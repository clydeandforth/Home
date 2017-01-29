#!/usr/bin/perl -w
#by_James_Doonan

use strict;
use warnings;

#usage ./JD_count.pl nucleotides.txt

my ($A, $C, $G, $T) ;

my ($nucleotides) = @ARGV;
open(IN, "< $nucleotides");

while (my $nucleotides = <IN>) {
	my $A = ($nucleotides =~ tr/A//);
	my $C = ($nucleotides =~ tr/C//);
	my $G = ($nucleotides =~ tr/G//);
	my $T = ($nucleotides =~ tr/T//);
	print "A = $A\nC = $C\nG = $G\nT = $T\n";
}

close(IN); 

#print ("A=$A\n", "C=$C\n", "G=$G\n", "T=$T\n");

