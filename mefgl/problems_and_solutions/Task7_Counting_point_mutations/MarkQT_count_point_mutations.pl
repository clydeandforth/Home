#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Getopt::Long;
use Path::Class;

my ( $seq1, $seq2, $file );
GetOptions(
    "seq1|1:s" => \$seq1,
    "seq2|2:s" => \$seq2,
    "file|f:s" => \$file
    );
die "USAGE: perl MarkQT_count_point_mutations.pl -1 <sequence1> -2 <sequence2>\nOR\nperl MarkQT_count_point_mutations.pl -f <in_file>\n"
    unless ( defined $seq1 and defined $seq2 and !defined $file ) or ( !defined $seq1 and !defined $seq2 and defined $file );

( $seq1, $seq2 ) = get_sequences( $file ) if defined $file;

die "Sequences are not of equal length\n" unless length $seq1 == length $seq2;

my $match_count = ( $seq1 ^ $seq2 ) =~ tr/\0//;
my $mismatch_count = length( $seq1 ) - $match_count;
print "Mismatches: $mismatch_count\n";

sub get_sequences{
    my $file = shift;
    
    my @sequences;
    my $fh = file( $file )->openr;
    while( my $line = $fh->getline() ){
	chomp $line;
	push @sequences, $line;
	die "More than 2 sequences present in file $file\n" if scalar @sequences > 2;
    }

    return @sequences;
}
