#!/bin/bash
# ** AUTO GENERATED **

# 1.6.1.5 - Ensure the MCS Translation Service (mcstrans) is not installed (Scored)

output=$(rpm -q mcstrans)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
