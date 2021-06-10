#!/bin/bash

#Variable : basic directory of this shell script
#Base on guess : that this shell script is in same directory
#Script written by Hoplin

dir=`pwd`

echo -e "\n========== New Execution at $(date +%Y)/$(date +%m)/$(date +%d) $(date +%H):$(date +%M) ==========" >> RestartLog.txt # 양옆 10개

#save 
echo $1>>.nowexecuting.txt
echo "Manage Process of :" $1 >> RestartLog.txt
echo -e "\n" >> RestartLog.txt

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
    echo -e "[ $(date +%Y)/$(date +%m)/$(date +%d) $(date +%H):$(date +%M):$(date +%S) ] : Please check log with same time data up of this log. If not exist, process closed in abnormal reason.\n" >> RestartLog.txt
done
echo -e "=======================================================\n\n" >> RestartLog.txt # 55개
