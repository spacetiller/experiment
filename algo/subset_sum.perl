#!/usr/bin/perl -w
#
# solve the subset sum problem with exhaustive search
#
#	Usage: ./subsetsum -s 17 2 5 9 21
#
# License: GPL
#

use strict;
use Getopt::Std;
use vars qw(%opts @set @picked);

$opts{s} = 0;
getopts('s:', \%opts);
@set = @ARGV;

$#picked = $#set;

sub subsetsum
{
	my ($d, $sum) = @_;

	if ($d > $#set) {
		return $sum == 0;
	}
	$picked[$d] = 0;
	if (subsetsum($d+1, $sum)) {
		return 1;
	}
	$picked[$d] = 1;
	if (subsetsum($d+1, $sum-$set[$d])) {
		return 1;
	}
	return 0;
}

if (subsetsum(0, $opts{s})) {
	for (my $i=0; $i<=$#set; ++$i) {
		print " + $set[$i]" if $picked[$i];
	}
print " = $opts{s}\n";
} 
else {
	print "$opts{s} is not the sum of any subset of {";
	foreach (@set) { print " $_"; }
	print " }\n";
}

