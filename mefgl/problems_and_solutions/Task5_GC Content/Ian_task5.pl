#!/usr/bin/perl -w
use strict;
use warnings;

## Usage: cat rosalind_gc.txt | perl ian_taskx.pl | sort -nk2,2 | tail -1 | tr '   ' '\n'

## This pipes the input fasta into the Perl script (which outputs <seq_ID>\t<GC_content>), sorts
## the output lines by GC content, prints the bottom line only (the one with the highest GC content)
## and then swaps the tab for a new line character (just because that was what the exercise required).

my $header = "";
my $element = "";
my @currentlinecontent = ();
my @totallinecontent = ();

## For each line in file fed to script using 'cat' function...

while (<STDIN>) {
    chomp;
    my $line = $_;

## If the line is a header (defined by '>' symbol), and if no previous sequence has been seen,
## store the sequence name and move on

    if (($line =~ /^>(\S+)/) && (! @currentlinecontent)) {
        $header = $1;
    }

## If the line is not a header and is not empty (i.e. if it is a sequence), put each character (base)
## into an array as a separate element. Then run through each of these elements and push (add) them
## to a 2nd array. This means that, as you run through a multi-line sequence, you can deal with it a 
## line at a time, adding each line's contents to @totallinecontent as you go.

    if (($line !~ /^>/) && ($line !~ /^$/)) {
        @currentlinecontent = split //, $line;
        foreach $element (@currentlinecontent) {
            push @totallinecontent, $element;
        }
    }

## If the line is a header and a previous sequence has been seen OR if you reach the last line in
## the file, count up the total number of Gs ($count_G) and Cs ($count_C) in the last sequence that
## was seen, as well as the total number of bases in the sequence ($count_all).
## Then calculate the proportion of Gs and Cs in that sequence and print along with the stored
## sequence name.
## Then empty all elements and arrays, ready to repopulate, starting with the new sequence ID. 

    if ((($line =~ /^>(\S+)/) && (@currentlinecontent)) || (eof ())) {
        my $count_G = grep { $_ eq 'G' } @totallinecontent;
        my $count_C = grep { $_ eq 'C' } @totallinecontent;
        my $count_all = scalar @totallinecontent;
        my $proportion = ($count_G + $count_C) / $count_all;
        print $header."\t".$proportion."\n";
        $header = $1;
        my $element = "";
        my @currentlinecontent = ();
        my @totallinecontent = ();
    }
}
