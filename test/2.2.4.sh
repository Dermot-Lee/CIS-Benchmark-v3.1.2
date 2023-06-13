#!/bin/sh
# ** AUTO GENERATED **

# 2.2.4 - Ensure CUPS is not enabled (Scored)

output=$(rpm -q cups)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
