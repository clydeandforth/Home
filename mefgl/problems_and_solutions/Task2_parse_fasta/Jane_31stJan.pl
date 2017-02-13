#!/usr/bin/perl
# Problem_31/01/17.pl
use strict; use warnings;

die "Usage: Problem_31/01/17.pl <file>\n" if (@ARGV != 1);
print "Processing file $ARGV[0]\n";

my $infile = <>;
my $sequence = ();
my $names;
my $base_count = 0;

my $line;
while ($line = $infile) {
	chomp $line;

	foreach my $line ($infile) {
		if($line = ~/^\s*$/) {         
			next;
		} elsif($line = ~/^\s*#/) {        
			next; 
		} elsif($line = ~/^>/) {           
			next;
		} else {
			$sequence = $line;
		}
	}
	{
		$sequence =~ s/\s//g;               
		return $sequence;
	}
}