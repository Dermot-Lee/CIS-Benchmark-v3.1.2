#!/bin/bash
# ** AUTO GENERATED **

# 1.7.2 - Ensure GDM login banner is configured (Scored)

# 检查 /etc/dconf/profile/gdm 文件是否存在并包含指定内容
if [ -f "/etc/dconf/profile/gdm" ] && 
   grep -q "user-db:user" "/etc/dconf/profile/gdm" && 
   grep -q "system-db:gdm" "/etc/dconf/profile/gdm" && 
   grep -q "file-db:/usr/share/gdm/greeter-dconf-defaults" "/etc/dconf/profile/gdm"; then
   exit 0
else
    exit 1
fi

# 检查 /etc/dconf/db/gdm.d/00-login-screen 文件是否存在并包含指定内容
if [ -f "/etc/dconf/db/gdm.d/00-login-screen" ] &&
   grep -q "[org/gnome/login-screen]" "/etc/dconf/db/gdm.d/00-login-screen" &&
   grep -q "disable-user-list=true" "/etc/dconf/db/gdm.d/00-login-screen"; then
    exit 0
else
    exit 1
fi

