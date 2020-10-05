#!/usr/bin/env perl
 
use strict;
use warnings;
 
use Math::Round;
 
my $val;
my %size;
my $total;
 
while(<>) {
    $val = $_;
    chomp($val);
    $size{$val * 512 / 1024}++;
    $total++;
}
 
foreach my $s (sort { $a <=> $b } keys %size) {
    printf "%3d:\t%6u (%2u%%)\n", $s, $size{$s},
        round($size{$s}/$total*100);
}
