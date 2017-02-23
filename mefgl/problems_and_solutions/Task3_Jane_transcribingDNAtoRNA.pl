#!/usr/bin/perl
# Task3_transcribingDNAtoRNA.pl
use strict; use warnings;

die "Usage: Task3_transcribingDNAtoRNA.pl <file>\n" if (@ARGV != 1);
print "Processing file $ARGV[0]\n";

my $text = <>;
$text =~ tr/t/T/;
$text =~ tr/T/U/;
print "$text\n";



