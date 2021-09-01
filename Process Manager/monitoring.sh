#!/bin/bash


echo "Process Related to Manager"
echo -e "======================================================="
echo `ps -ef | grep 'executeChecker.sh' | grep -v 'grep'`
echo `ps -ef | grep 'restart.sh' | grep -v 'grep'`
echo `ps -ef | grep 'execute.sh' | grep -v 'grep'`
echo -e "=======================================================\n"

echo "Process Related to Program"
managingProcess=$(<.nowexecuting.txt)
echo -e "======================================================="
echo `ps -ef | grep $managingProcess | grep -v 'grep' | grep -v sh`
echo -e "======================================================="
