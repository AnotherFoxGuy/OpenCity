#!/bin/bash

function gen() {
    css=$1
    dir=$2
    fix=$3
    echo "$css $dir $fix"
    batik -h 64 -w 64 -cssAlternate $css *.svg
    rm $dir/*.png
    mv *.png $dir
    if [ "$3" != "" ]; then
	for i in $dir/*.png; do
	    mv $i `echo $i | sed "s/\(.*\)\.png/\\1_$fix.png/"`
	done
    fi
}

gen Menu menu
gen MenuOver menu_over over
gen MenuDisable menu_disable disable
gen MenuActivate menu_activate activate
gen Splash splash
gen Bar bar
gen BarOver bar_over over
