#!/bin/bash

echo -e "=======================================================\n\n" >> RestartLog.txt

managingProcess=$(<.nowexecuting.txt)
#Script written by Hoplin
getExecuteCheckerPID=`ps -ef | grep 'executeChecker.sh' | grep -v 'grep' | awk '{print $2}'`
getRestartCheckerPID=`ps -ef | grep 'restart.sh' | grep -v 'grep' | awk '{print $2}'`
getExecuterPID=`ps -ef | grep 'execute.sh' | grep -v 'grep' | awk '{print $2}'`
pid="ps -ef | grep '$managingProcess' | grep -v 'grep' | grep -v 'bash'"
getProcessPID=`eval $pid | awk '{print $2}'`


echo `kill -9 $getExecuteCheckerPID`
echo `kill -9 $getRestartCheckerPID`
echo `kill -9 $getExecuterPID`
echo `kill -15 $getProcessPID`
echo `rm .nowexecuting.txt`
