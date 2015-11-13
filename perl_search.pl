#!/usr/bin/perl
#by_James_Doonan


use strict;
use warnings;

my $file = 'refseq_blastall.out.143337';
open my $infile, '<', $file or die "Cannot open file: $!";

my (@group1, @group2, @group3, @group4,	@group5, @group6, @group7, @group8, @group9);

while(<$infile>) {
#skip lines starting with #
	next if /^\s*#/;
	s/#.*$//;
	my @split = split('\t');
	push @group1, $split[0];
	push @group2, $split[1];
	push @group3, $split[2];
	push @group4, $split[3];
	#print if the blast hit is more than 97% for at least 50 amino acids
        print if ($split[2] >= 97 && $split[3] >= 50);
       
}


close($infile);

