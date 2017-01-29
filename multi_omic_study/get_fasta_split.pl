#!/usr/bin/perl

use strict;
use warnings;


use Bio::DB::Fasta;

#usage infasta.fa queryfile.txt
my $seq;
my $fastaFile = shift;
my $queryFile = shift;
my (@group1, @group2, @group3, @group4);

my $db = Bio::DB::Fasta->new( $fastaFile );
open (IN, $queryFile);
while (<IN>){
	chomp; 
	my @split = split('\t');
	push @group1, $split[0];
	push @group2, $split[1];
    	push @group3, $split[2];
    	push @group4, $split[3];
	$seq = $split[0];
    my $sequence = $db->seq($split[0]);
    if  (!defined( $sequence )) {
            die "Sequence $seq not found. \n" 
    }   
    print ">$seq|$split[1]|$split[2]|$split[3]\n", "$sequence\n";
}
