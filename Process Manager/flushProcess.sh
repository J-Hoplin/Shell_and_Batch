#!/bin/bash

echo "[ $(date +%Y)/$(date +%m)/$(date +%d) $(date +%H):$(date +%M):$(date +%S) ] : Manager closed safely" >> RestartLog.txt
echo -e "=======================================================\n\n" >> RestartLog.txt

managingProcess=$(<.nowexecuting.txt)
#Script written by Hoplin
getExecuteCheckerPID=`ps -ef | grep 'executeChecker.sh' | grep -v 'grep' | awk '{print $2}'`
getRestartCheckerPID=`ps -ef | grep 'restart.sh' | grep -v 'grep' | awk '{print $2}'`
getExecuterPID=`ps -ef | grep 'execute.sh' | grep -v 'grep' | awk '{print $2}'`
pid="ps -ef | grep '$managingProcess' | grep -v 'grep' | grep -v 'bash'"
getProcessPID=`eval $pid | awk '{print $2}'`


kill -9 $getExecuteCheckerPID
kill -9 $getRestartCheckerPID
kill -9 $getExecuterPID
kill -15 $getProcessPID
rm .nowexecuting.txt
