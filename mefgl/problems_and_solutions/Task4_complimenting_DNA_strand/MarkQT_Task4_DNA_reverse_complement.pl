#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Getopt::Long;
use Path::Class qw(file);
use Const::Fast;
use Smart::Comments;
#Define reverse complement for all bases including IUPAC
const my %REV_COMP => ( 'A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C',
			'R' => 'Y', 'Y' => 'R', 'S' => 'W', 'W' => 'S',
			'K' => 'M', 'M' => 'K', 'B' => 'V', 'V' => 'B',
			'D' => 'H', 'H' => 'D', 'N' => 'N', '.' => '.',
			'-' => '-' );
#Specify how many bases per line in output file
const my $BASES_PER_LINE => 50;

#Specify command line arguments and throw error if not given
GetOptions(
    "in|i=s"  => \my $in_file,
    "out|o=s" => \my $out_file,
    ) or die ( "USAGE: perl MarkQT_Task4_DNA_reverse_complement.pl --in <in_file> --out <out_file>\n" );

#Read sequence from file
my $sequence = get_sequence( $in_file );
#Generate reverse complement
my $reverse_comp = reverse_complement( $sequence );
#Write reverse complement to file
write_sequence_to_file( $out_file, $reverse_comp );

sub get_sequence{
    my $file = shift;
    
    my $sequence = "";
    my $fh = file( $file )->openr();            #Create filehandle to read file
    while( my $line = $fh->getline() ){         #Read each line of the file
	chomp $line;                            #Remove newline from end of string
	### Line: $line
	$sequence .= $line;                     #Add line to sequence
    }

    return $sequence;
}

sub reverse_complement{
    my $sequence = shift;
    ### Seq: $sequence
    my @bases = split( //, $sequence );                             #Split sequence into an array of individual bases
    my $reverse_complement = "";
    for my $base( reverse @bases ){                                 #Loop through array in reverse order
	die "Unrecognised base $base\n"
	    unless exists $REV_COMP{ $base };                       #Throw error and kill script if base not recognised
	if ( $base eq uc $base ){                                   #Test if base is upper case
	    $reverse_complement .= $REV_COMP{ $base };              #Add upper case complementary base
	}
	else{
	    $reverse_complement .= lc( $REV_COMP{ $base } );        #Add lower case complementary base
	}
    }

    return $reverse_complement;
}

sub write_sequence_to_file{
    my ( $out_file, $sequence ) = @_;

    my @lines = unpack( '(A' . $BASES_PER_LINE . ')*', $sequence );  #Split sequence into lines of specified length
    my $out_fh = file( $out_file )->openw();                         #Create filehandle to write file
    for my $line( @lines ){
	$out_fh->print( $line . "\n" );
    }

    return;
}
