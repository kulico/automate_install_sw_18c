#!/bin/sh
file="/home/oracle/scripts/count_db_name.txt"
i=$(cat $file)
echo Old counter number is $i
i=$((i+1))
echo New counter number is $i
echo $i >/home/oracle/scripts/count_db_name.txt