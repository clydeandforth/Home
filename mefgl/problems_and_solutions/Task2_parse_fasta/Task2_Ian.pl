#!/usr/bin/perl -w
use strict;
use warnings;

my $Acount = "";
my $Tcount = "";
my $Ccount = "";
my $Gcount = "";
my $totalcount = "";

while (<STDIN>) {
	chomp;
	my $line = $_;
	if ($line =~ />(\S+)\.1/) {
		print "Gene ID: ".$1."\n";
	}
	if (($line !~ />/) && ($line !~ /^$/)) {
		$line =~ s/\n//g;
		$Acount = ($line =~ tr/[Aa]//);
		$Tcount = ($line =~ tr/[Tt]//);
		$Ccount = ($line =~ tr/[Cc]//);
		$Gcount = ($line =~ tr/[Gg]//);
		$totalcount = ($line =~ tr/[A-Z][a-z]//);
		print "Sequence Length: ".$totalcount."\n";
		print "A: ".$Acount."\n";
		print "T: ".$Tcount."\n";
		print "C: ".$Ccount."\n";
		print "G: ".$Gcount."\n\n";
	}
}
