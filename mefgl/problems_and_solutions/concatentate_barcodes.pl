#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Getopt::Long;
use Path::Class qw(file);
use Bio::SeqIO;

GetOptions(
    "in|i=s" => \my $in_files,
    "out|o=s" => \my $out_file
    ) or die "Usage: perl concatenate_barcodes.pl --in <in_file1,infile2,infile3> --out <out_file>";

my ( %species_ids, %species_seq_counts );
my @barcode_files = split( ',', $in_files );
my $barcode_file_count = 0;
for my $barcode_file( @barcode_files ){
    $barcode_file_count++;
    my $seq_io = Bio::SeqIO->new( -format => 'fasta', -file => $barcode_file );
    while( my $seq = $seq_io->next_seq ){
	my ( $species_and_count, @ids ) = split( /\|/, $seq->display_id );
	my ( $species, $count ) = $species_and_count =~ /^(.+)_(\d+)$/;
	$species_seq_counts{$species}{$barcode_file_count}{$seq->seq} += $count;
	for my $id( @ids ){
	    $species_ids{$species}{$id}++;
	}
    }
}

my $out_fh = file( $out_file )->openw();
for my $species( sort keys %species_ids ){
    $out_fh->print( '>' . $species . '|' . join( '|', sort keys %{$species_ids{$species}} ) . "\n" );
    my $concatenated_sequence = "";
    for my $barcode_file( sort {$a<=>$b} keys %{$species_seq_counts{$species}} ){
	my $seq_count = 0;
	my $sequence = "";
	for my $seq_variant( keys %{$species_seq_counts{$species}{$barcode_file}} ){
	    my $var_count = $species_seq_counts{$species}{$barcode_file}{$seq_variant};
	    if ( $var_count > $seq_count ){
		$seq_count = $var_count;
		$sequence = $seq_variant;
	    }
	}
	$concatenated_sequence .= $sequence;
    }
    $out_fh->print( $concatenated_sequence . "\n" );
}
