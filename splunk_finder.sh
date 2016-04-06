#!/bin/bash
export blah=$SPLUNK_HOME/etc/apps/
export results=/tmp/results
cd $blah
for i in $( ls ); do
                cd $blah$(echo $i | tr -d '\r')
                for l in $( ls ); do
                        if [ "$l" ==  "local" ]
                                then
                                cd local
                                for x in $( ls *.conf ); do
                                        diff $x ../default/$x >> $results$i"_"$x
                                done    
                        fi      
                done    
done   