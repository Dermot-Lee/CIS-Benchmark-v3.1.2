#!/bin/bash
# ** AUTO GENERATED **

# 1.8.1 - Ensure GNOME Display Manager is removed (Scored)


rpm -q gdm | grep -qE "(package gdm is not installed|未安装软件包 gdm)" && exit 0 || exit 1
