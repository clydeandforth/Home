#!/usr/bin/perl
#by_James_Doonan


use strict;
use warnings;

my $file = 'L5_L6_mapped_to_Gq.txt';
open my $infile, '<', $file or die "Cannot open file: $!";

my (@group1, @group2, @group3, @group4,	@group5, @group6, @group7, @group8, @group9, @group10, @group11);

while(<$infile>) {
	next if /^\s*#/;
	s/#.*$//;
	my @split = split('\t');
	push @group1, $split[0];
	push @group2, $split[1];
	push @group3, $split[2];
	push @group4, $split[3];
	push @group5, $split[4];
	push @group6, $split[5];
	push @group7, $split[6];
	push @group8, $split[7];
	push @group9, $split[8];
	push @group10, $split[9];
	push @group11, $split[10];
	#print the line if there are more than 3 transcripts hitting one gene and it covers more than 200 bp of the gene
        print if ($split[2] + $split[3] >= 200 && $split[10] >= 3);
       
}


close($infile);

