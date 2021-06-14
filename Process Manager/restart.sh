#!/bin/bash

#Script written by Hoplin

dir=`pwd`

while true
do
    sleep $2
    getPID="ps -ef | grep '$1' | grep -v 'grep' | grep -v 'bash'"  # | awk '{print $2}'`
    getExecutePID=`eval $getPID | awk '{print $2}'`
    if [ -z $getExecutePID ]
    then
        continue
    else
        echo "[ $(date +%Y)/$(date +%m)/$(date +%d) $(date +%H):$(date +%M):$(date +%S) ] : Restart Process" >> RestartLog.txt
        echo `kill -15 $getExecutePID`
    fi
done
