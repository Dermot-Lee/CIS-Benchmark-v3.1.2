#!/bin/bash
# ** AUTO GENERATED **

# 2.2.1.1 - Ensure time synchronization is in use (Not Scored)

result_chrony=$(rpm -q chrony)
result_ntp=$(rpm -q ntp)

flag_chrony=0
flag_ntp=0

if [[ $result_chrony == chrony-* ]]
then
    flag_chrony=1
fi

if [[ $result_ntp == ntp-* ]]
then
    flag_ntp=1
fi

echo $flag_chrony > /tmp/flag_chrony.txt
echo $flag_ntp > /tmp/flag_ntp.txt

if [[ $flag_chrony -eq 1 || $flag_ntp -eq 1 ]]
then
    exit 0
else
    exit 1
fi

