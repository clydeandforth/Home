#!/usr/bin/perl -w
use strict;
use warnings;

my $data = $ARGV[0];
my @array1;
my @array2;
my $i = -1;
my $j = 0;

open (DATA, $data) or die "Couldn't open data file\n";

while (<DATA>){
    chomp;
    if (@array1 == 0) {
        push @array1, split "";
    }
    else {push @array2, split "";
    }
}

foreach (@array1) {
    $i++;
    if ($_ !~ $array2[$i]) {
        $j++;
    }
}

print $j."\n";

close (DATA) or die "Couldn't close data file\n";
~                                                     
