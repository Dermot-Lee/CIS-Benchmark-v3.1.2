#!/bin/sh
# ** AUTO GENERATED **

# 2.2.15 - Ensure telnet-server is not installed (Scored)

output=$(rpm -q telnet-server)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi