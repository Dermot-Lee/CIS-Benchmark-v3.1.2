#!/bin/bash
# ** AUTO GENERATED **

# 1.6.1.4 - Ensure SETroubleshoot is not installed (Scored)

output=$(rpm -q setroubleshoot)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
