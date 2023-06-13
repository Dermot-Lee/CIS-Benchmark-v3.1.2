#!/bin/sh
# ** AUTO GENERATED **

# 2.2.6 - Ensure LDAP server is not installed (Scored)

output=$(rpm -q openldap-servers)

if [[ $output == *"is not installed"* ]] || [[ $output == *"未安装软件包"* ]]; then
    exit 0
else
    exit 1
fi
