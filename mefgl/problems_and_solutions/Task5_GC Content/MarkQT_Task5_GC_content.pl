#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Getopt::Long;
use Path::Class qw(file);
use Bio::SeqIO;
use Math::Round qw(nearest);
use Const::Fast;

const my $ACCURACY => 0.001;

GetOptions(
    "in|i=s" => \my $in_file,
    "out|o=s" => \my $out_file
    ) or die "USAGE: perl MarkQT_Task5_GC_content.pl --in <in_file> --out <out_file>\n";

my %gc_content;
my $seq_io = Bio::SeqIO->new( '-format' => 'fasta', -file => $in_file ); #Create Bio::SeqIO object for fasta file
while( my $seq = $seq_io->next_seq ){                                    #Get each sequence
    $gc_content{ $seq->display_id } = calculate_gc_content( $seq->seq ); #Calculate GC content and store in hash with ID as key
}

my $out_fh = file( $out_file )->openw();                                 #Create filehandle for writing file
$out_fh->print( '#Sequence,GC content (%)' );
for my $seq_id( sort {$gc_content{$b}<=>$gc_content{$a}} keys %gc_content ){  #Loop through hash in reverse order of values - i.e. highest first
    $out_fh->print( "\n" . $seq_id . ',' . nearest( $ACCURACY, $gc_content{ $seq_id } ) ); #Use Math::Round::nearest to specify accuracy
}

sub calculate_gc_content{
    my $sequence = shift;

    my $cg_count = 0;
    my @bases = split( //, $sequence );
    for my $base( @bases ){
	if ( uc($base) =~ /^[CGS]$/ ){                  # S is either C or G
	    $cg_count++;
	}
	elsif( uc($base) =~ /^[MRYKN]$/ ){
	    $cg_count += 0.5;                           # 1 in 2 chance of these bases being C or G
	}
	elsif( uc($base) =~ /^[HD]$/ ){
	    $cg_count += 1/3;                           # 1 in 3 chance of these bases being C or G
	}
	else{
	    $cg_count += 2/3 if uc($base) =~ /^[VB]$/;  # 2 in 3 chance of these bases being C or G
	}
    }

    return ( ( $cg_count / length $sequence ) * 100 );
}
