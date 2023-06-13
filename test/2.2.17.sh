#!/bin/sh
# ** AUTO GENERATED **

# 2.2.17 - Ensure nfs-utils is not installed or the nfs-server service is masked (Scored)

output=$(rpm -q nfs-utils)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
