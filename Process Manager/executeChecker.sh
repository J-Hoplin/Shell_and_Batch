#!/bin/bash

#Variable : basic directory of this shell script
#Base on guess : that this shell script is in same directory
#Script written by Hoplin

function addToResLog(){
    echo -e $1 >> RestartLog.txt
}


dir=`pwd`

addToResLog "\n========== New Execution at $(date +%Y)/$(date +%m)/$(date +%d) $(date +%H):$(date +%M) =========="

#save 
echo $1>>.nowexecuting.txt
addToResLog "Manage Process of : ${1}" 
addToResLog "Restart Cycle : ${2}" 
addToResLog "\n"

while true
do
    pid="ps -ef | grep '$1' | grep -v 'grep' | grep -v 'bash'"
    getPID=`eval $pid | awk '{print $2}'`
    # -z $getPID : getPID 변수의 string byte값이 0인 경우 true를 의미한다
    # -z옵션 : check if the given string operand size is zero
    if [ -z $getPID ]
    then
        echo `bash execute.sh`
    fi
    addToResLog "[ $(date +%Y)/$(date +%m)/$(date +%d) $(date +%H):$(date +%M):$(date +%S) ] : Please check log with same time data up of this log. If not exist, process closed in abnormal reason.\n"
done
