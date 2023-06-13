#!/bin/sh
# ** AUTO GENERATED **

# 2.1.1 - Ensure xinetd is not installed (Scored)

rpm -q xinetd | grep -qE "(package xinetd is not installed|未安装软件包 xinetd)" && exit 0 || exit 1

