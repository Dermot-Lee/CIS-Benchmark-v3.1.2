#!/bin/bash
# ** AUTO GENERATED **

# 5.4.4 - Ensure password reuse is limited (Scored)

# 定义需要在文件中搜索的字符串
password_str="password\s+(requisite|required)\s+pam_pwhistory\.so\s+([^#]+\s+)*remember=([5-9]|[1-9][0-9]+)\b"

# 检查system-auth文件
grep -Pq "$password_str" /etc/pam.d/system-auth || exit 1

# 检查password-auth文件
grep -Pq "$password_str" /etc/pam.d/password-auth || exit 1

# 如果所有的检查都通过了，那么退出状态码为0
exit 0

