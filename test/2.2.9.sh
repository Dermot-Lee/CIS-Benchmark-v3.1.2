#!/bin/sh
# ** AUTO GENERATED **

# 2.2.9 - Ensure HTTP Server is not installed (Scored)

output=$(rpm -q httpd)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
