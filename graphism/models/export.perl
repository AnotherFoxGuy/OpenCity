#!/usr/bin/perl -w

use strict;
use File::Copy;
require 'dumpvar.pl';

my $gfx = "../..";
my $dir = "$gfx/../../opencity/graphism/";


$_ = `pwd`;
my ($type,$name) = /.*\/(.*)\/(.*)/;

my $in_ac = "$name.in.ac";
my $ac = "$name.ac";
my $xml = "$name.xml";

if( -e $in_ac && -e $ac && -M $in_ac < -M $ac )
{
    $_ = `$gfx/conv.perl $in_ac`;
    print $_;
    if( ! /OK/ )
    { 
	die( "FAIL" );
    }
}

if( -e $xml )
{
    `xmllint --schema $gfx/object.xsd $xml > /dev/null && echo $?`;
    my $ret = chomp;
    print "$ret\n";
    if( $ret ne "1" )
    {
	die( "FAIL" );
    }
}
else
{
    print "no .xml file\n";
}

if( -e $ac )
{
    if( ! -e "$dir/$type" )
    {
	print "mkdir $dir/$type\n";
	mkdir( "$dir/$type" );
    }
    print "Export ....\n";
    $name = "$type/$name";
    if( ! -e "$dir/$name" )
    {
	print "mkdir $dir/$name\n";
	mkdir( "$dir/$name" );
    }
    if( ( -e "$dir/$name/$ac" && -M $ac != -M "$dir/$name/$ac" ) || ! -e "$dir/$name/$ac" )
    {
	print "copy $ac $dir/$name/$ac\n";
	copy( $ac, "$dir/$name/$ac" );
    }
    if( ( -e "$dir/$name/$xml" && -M $xml != -M "$dir/$name/$xml" ) || ! -e "$dir/$name/$xml" )
    {
	print "copy $xml $dir/$name/$xml\n";
	copy( $xml, "$dir/$name/$xml" );
    }
    open( IN, $ac );
    while( <IN> )
    {
	if( /^texture \"(.*)\"/ )
	{
	    print "	$1\n";
	    if( ( -e "$dir/$name/$1" && -M $1 != -M "$dir/$name/$1" ) || ! -e "$dir/$name/$1" )
	    {
		#print "copy $1 $dir/$name/$1\n";
		copy( $1, "$dir/$name/$1" );
	    }
	}
    }
    close( IN );
}
else
{
    print "no .ac file\n";
}
