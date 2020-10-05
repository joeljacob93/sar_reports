#!/bin/sh
echo "+-------------------------------------------------------------------------------------------------------------------+"
echo "|Average:       IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s                         |"
echo "+-------------------------------------------------------------------------------------------------------------------+"
for file in `ls -tr /var/log/sa/sa* | grep -v sar`
do
dat=`sar -f $file | head -n 1 | awk '{print $4}'`
echo -n $dat
sar -n DEV -f $file  | grep -i Average | sed "s/Average://" | grep ens3
done
echo "+-------------------------------------------------------------------------------------------------------------------+"
