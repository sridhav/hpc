#!/bin/bash
# Usage ./ordered.sh -np 16 ./intcurve
temp_file=$(mktemp /tmp/temp.XXXXX)
/opt/mpich/bin/mpiexec --prepend-pattern="%r " $@ > $temp_file
rank_file=$(mktemp /tmp/rank.XXXXX)
new_file=$(mktemp /tmp/rank.XXXXX)
cat $temp_file | grep -v 'rank' | cut -d ' ' -f2-  > $rank_file
cat $temp_file | grep 'rank' | sort -g | cut -d ' ' -f2- > $new_file
sed  "5 r $new_file" $rank_file
rm -rf $new_file $temp_file $rank_file
