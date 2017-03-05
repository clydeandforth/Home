#!/usr/bin/perl
# Task4_reversecompliment.pl
use strict; use warnings;

die "Usage: Task4_reversecompliment.pl <file>\n" if (@ARGV != 1);
print "Processing file $ARGV[0]\n";

my $DNA = <>;					##read in the file to a string called DNA
my $reverse_compliment = reverse($DNA);		##find the reverse of the DNA string and assign this to a new string called reverse_compliment
$reverse_compliment =~ tr/AGTC/TCAG/;		##find the compliment of each nucleotide

print "$reverse_compliment\n";			##print the answer



