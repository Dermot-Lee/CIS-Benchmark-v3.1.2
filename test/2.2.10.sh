#!/bin/sh
# ** AUTO GENERATED **

# 2.2.10 - Ensure IMAP and POP3 server is not installed (Scored)

output=$(rpm -q dovecot)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
