#!/bin/sh
# ** AUTO GENERATED **

# 2.3.3 - Ensure talk client is not installed (Scored)
output=$(rpm -q talk)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
