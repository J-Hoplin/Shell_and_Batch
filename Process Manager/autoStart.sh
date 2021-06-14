#!/bin/bash

#Script written by Hoplin

getExecuteCheckerPID=`ps -ef | grep 'executeChecker.sh' | grep -v 'grep' | awk '{print $2}'`
getRestartPID=`ps -ef | grep 'restart.sh' | grep -v 'grep' | awk '{print $2}'`


#Manage process will enrolled in condition of : Not detected of execution of executeChecker.sh and restart.sh
if [ -z $getExecuteCheckerPID ] && [ -z $getRestartPID]
then
    if [ -z $1 ]
    then
        if [ -z $2 ]
        then
            echo -e "Argument Error : Require 2 arguments! \n 1) parameter1 : file name you want to manage \n 2) parameter2 : Cycle of time you want to restart \n ex) 1s : 1second 1m : 1minute 1h : 1hours 1d : 1days"
        else
            echo -e "Argument Error : Require 2 arguments! \n 1) parameter1 : file name you want to manage \n 2) parameter2 : Cycle of time you want to restart \n ex) 1s : 1second 1m : 1minute 1h : 1hours 1d : 1days"
        fi
    else
        # 매개변수 전달 : 파일명.확장자
        echo `nohup bash executeChecker.sh $1 $2 >> managelog.txt &`
        echo `nohup bash restart.sh $1 $2 >> managelog.txt &`
    fi
else
    echo "Process manage flow is already Running! Check process again!"
fi