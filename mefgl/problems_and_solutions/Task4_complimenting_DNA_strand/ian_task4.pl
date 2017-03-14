#!/usr/bin/perl -w

use strict;
use warnings;
my $seq = $ARGV[0];
my @chars = ();
my @revchars = ();

open (SEQ, $seq) or die "Couldn't open sequence file\n";

while (<SEQ>) {
    chomp;
    my $line = $_;
    if ($line =~ /\w/) {
         @chars = split("", $line);
    }
    @revchars = reverse @chars;
    foreach (@revchars) {
        if ($_ =~ /T/) {print "A"};
        if ($_ =~ /A/) {print "T"};
        if ($_ =~ /G/) {print "C"};
        if ($_ =~ /C/) {print "G"};
    }
}

close (SEQ) or die "Couldn't close sequence file\n";
