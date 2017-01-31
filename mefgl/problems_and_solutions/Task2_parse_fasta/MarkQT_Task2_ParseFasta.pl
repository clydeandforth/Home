#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Getopt::Long;
use Path::Class qw(file);
use Smart::Comments;

GetOptions(
    "in|i=s" => \my $in_file,
    "out|o=s" => \my $out_file
    ) or die "Usage: perl MarkQT_Task1_NucleotideCount.pl --in <in_file> --out <out_file>\n";

my $sequence_info = parse_fasta( $in_file );
print_sequence_info( $sequence_info, $out_file );

sub parse_fasta{
    #Reads the file and stores sequence ID, length, and base counts for each sequence in a hash
    my $file = shift;

    my ( %seq_info );
    my ( $seq_id, $seq );
    my $fh = file( $file )->openr();
    while( my $line = $fh->getline() ){
	chomp $line;
	if ( $line =~ /^>/ ){
	    if ( defined $seq ){
		$seq_info{ $seq_id }{ 'length' } = length $seq;
		( $seq_info{ $seq_id }{ 'bases' } ) = count_bases( $seq );
	    }
	    ( $seq_id ) = $line =~ /^>(\S+)\s/;
	    $seq = "";
	}
	else{
	    $seq .= $line;
	}
    }
    $seq_info{ $seq_id }{ 'length' } = length $seq;
    $seq_info{ $seq_id }{ 'bases' } = count_bases( $seq );

    return \%seq_info;
}

sub count_bases{
    #Counts the number of occurrences of all bases in a sequence
    my $sequence = shift;

    my @bases = split( //, $sequence );
    my %base_counts;
    for my $base( @bases ){
	$base_counts{ uc($base) }++; #Count lower and upper case bases as the same
    }

    return \%base_counts;
}

sub print_sequence_info{
    #Prints a table of results in CSV format
    my ( $seq_info, $out_file ) = @_;

    my $bases_found = get_bases_found( $seq_info ); #Need to know which bases were found (in any sequence) to generate columns in table

    my $out_fh = file( $out_file )->openw();
    #Print the table header lines - use of hash character at start of each line allows these to be easily filtered out
    $out_fh->print( '#Transcript ID,Length,Base counts' . "\n" . '#,' );
    for my $base( sort keys %{$bases_found} ){
	$out_fh->print( ',' . $base );
    }

    for my $seq_id( sort keys %{$seq_info } ){
	$out_fh->print( "\n" . join( ',', $seq_id, $seq_info->{$seq_id}{'length'} ) );
	for my $base( sort keys %{$bases_found} ){
	    #Check if each base was found for this sequence - if not, assign a value of 0
	    my $base_count = exists $seq_info->{ $seq_id }{ 'bases' }{ $base } ? $seq_info->{ $seq_id }{ 'bases' }{ $base } : 0;
	    $out_fh->print( ',' . $base_count );
	}
    }

    return;
}

sub get_bases_found{
    my $seq_info = shift;
  
    my %bases_found;
    for my $seq_id( keys %$seq_info ){
	for my $base ( keys %{$seq_info->{ $seq_id }{ 'bases' }} ){
	    $bases_found{ $base }++;
	}
    }
    
    return \%bases_found;
}
