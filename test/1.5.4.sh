#!/bin/sh
# ** AUTO GENERATED **

# 1.5.4 - Ensure prelink is disabled (Scored)

output=$(rpm -q prelink)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
