#!/bin/sh
# ** AUTO GENERATED **

# 2.2.19 - Ensure rsync is not installed or the rsyncd service is masked (Scored)

output=$(rpm -q rsync)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
