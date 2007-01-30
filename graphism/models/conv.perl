#!/usr/bin/perl -w

use strict;

my ( $file_in ) = @ARGV;
defined $file_in || die "Usage : conv.perl file_in.in.ac\n";
$_ = $file_in;
s/(.*)\.in\.ac/$1/; 
my $base = $_;
my $file_out = "$base.ac";

open( IN, "$file_in" ) || die "No file \"$file_in\"\n";
open( OUT, ">$file_out" ) || die "File error \"$file_out\"\n";

sub log2 { return log($_[0])/log(2); }

while( <IN> )
{
    if( /^texture \"(.*)\"/ )
    {
	my $img = $1;
	$_ = $img;
	my ($name) = /(.*)\.gif/;
	if( -e "$name.png" ) { $img = "$name.png"; }
	elsif( -e "$name.jpeg" ) { $img = "$name.jpeg"; }
	else{ die "No other texture than $img\n"; }
	$_ = `identify "$img"`;
	my ($w,$h) = /([0-9]+)x([0-9]+)/;
	if( $w<64 || $h<64 || int(log2($w))!=log2($w) || int(log2($h))!=log2($h) || $w>512 || $h>512 )
	{
	    print "$name : Texture size is $w"."x$h, must be power of 2 and bigger than 64x64 and lower than 512x512\n";
	}
	print "N=($w"."x$h) $name\n";
	print OUT "texture \"$img\"\n";
    }
    else
    {
	print OUT $_;
    }
}


close( IN );
close( OUT );

print "OK\n";
