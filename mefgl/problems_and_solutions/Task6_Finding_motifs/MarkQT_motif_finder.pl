#!/usr/bin/perl
use Getopt::Long;
use Path::Class qw(file);
use Getopt::Long;

my ( $motif, $string, $file );
GetOptions(
    "motif|m:s" => \$motif,
    "string|s:s" => \$string,
    "file|f:s" => \$file
    );

die "USAGE: perl MarkQT_motif_finder.pl -m <motif> -s <string>\n\nOR\n\nperl MarkQT_motif_finder.pl -f <in_file>"
    unless ( $motif ne '' and $string ne '' and $file eq '' ) or ( $motif eq '' and $string eq '' and $file ne '' );

( $motif, $string ) = parse_file( $file ) if $file ne '';
die "Search motif is longer than string to be searched\n" unless length $motif <= length $string;

my @match_positions;
for ( $string ){
    push @match_positions, pos() + 1 while /(?=$motif)/g;       # Add 1 as pos returns 0-based index
}

print join(' ', @match_positions ) . "\n";


sub parse_file{
    my $file = shift;

    my $line_no = 0;
    my ( $string, $motif );
    my $fh = file( $file )->openr();
    while( my $line = $fh->getline() ){
	$line_no++;
	chomp $line;
	if ( $line_no == 1 ){
	    $string = $line;
	}
	elsif( $line_no == 2 ){
	    $motif = $line;
	}
	else{
	    die "File $file is not in expected format of string on line 1 and motif on line 2\n";
	}
    }
    
    return ( $motif, $string );
}
