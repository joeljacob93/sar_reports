#!/bin/sh
echo "+----------------------------------------------------------------------------------+"
echo "|Average:         runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked        |"
echo "+----------------------------------------------------------------------------------+"
for file in `ls -tr /var/log/sa/sa* | grep -v sar`
do
dat=`sar -f $file | head -n 1 | awk '{print $4}'`
echo -n $dat
sar -q -f $file  | grep -i Average | sed "s/Average://"
done
echo "+----------------------------------------------------------------------------------+"

