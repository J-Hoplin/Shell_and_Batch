#!/bin/bash

#Script written by Hoplin

getExecuteCheckerPID=`ps -ef | grep 'executeChecker.sh' | grep -v 'grep' | awk '{print $2}'`
getRestartPID=`ps -ef | grep 'restart.sh' | grep -v 'grep' | awk '{print $2}'`


#Manage process will enrolled in condition of : Not detected of execution of executeChecker.sh and restart.sh
if [ -z $getExecuteCheckerPID ] && [ -z $getRestartPID]
then
    if [ -z $1 ]
    then
        echo "Argument Missing! : 1 arguments that means the file name you want to execute is required." 
    else
        # 매개변수 전달 : 파일명.확장자
        echo `nohup bash executeChecker.sh $1 >> managelog.txt &`
        echo `nohup bash restart.sh $1 >> managelog.txt &`
    fi
else
    echo "Process manage flow is already Running! Check process again!"
fi