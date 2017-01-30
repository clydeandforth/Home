#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Getopt::Long;
use Path::Class qw(file);

GetOptions(
    "in|i=s" => \my $in_file
    ) or die "Usage: perl MarkQT_Task1_NucleotideCount.pl --in <in_file>\n";

my $sequence = get_sequence( $in_file );
my $nucleotide_counts = count_bases( $sequence );
print_base_counts( $nucleotide_counts );

sub get_sequence{
    my $file = shift;

    my $sequence;
    my $fh = file( $file )->openr();
    while( my $line = $fh->getline() ){
	chomp $line;
	$sequence .= $line;
    }
    return $sequence;
}

sub count_bases{
    my $sequence = shift;

    my @bases = split( //, $sequence );
    my %base_counts;
    for my $base( @bases ){
	$base_counts{ uc($base) }++; #Count lower and upper case bases as the same
    }

    return \%base_counts;
}

sub print_base_counts{
    my $base_counts = shift;

    for my $base( sort keys %{$base_counts} ){
	print "$base: $base_counts->{$base}\n";
    }

    return;
}
