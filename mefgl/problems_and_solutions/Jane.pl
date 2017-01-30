#!/usr/bin/perl
# Problem_17/01/17.pl
use strict; use warnings;

die "Usage: Problem_17/01/17.pl <file>\n" if (@ARGV != 1);
print "Processing file $ARGV[0]\n";

my $sequence = <>;
my $g_count = ($sequence =~ tr/G/G/);
my $a_count = ($sequence =~ tr/A/A/);
my $c_count = ($sequence =~ tr/C/C/);
my $t_count = ($sequence =~ tr/T/T/);

print "	G occurs $g_count times\n
	A occurs $a_count times\n
	C occurs $c_count times\n
	T occurs $t_count times\n";

