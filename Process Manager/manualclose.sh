#!/bin/bash

managingProcess=$(<.nowexecuting.txt)
#Script written by Hoplin
echo "[ $(date +%Y)/$(date +%m)/$(date +%d) $(date +%H):$(date +%M):$(date +%S) ] : Process has been removed manually by the user" >> RestartLog.txt
pid="ps -ef | grep '$managingProcess' | grep -v 'grep' | grep -v 'bash'"
value=`eval $pid | awk '{print $2}'` 
kill -15 $value
