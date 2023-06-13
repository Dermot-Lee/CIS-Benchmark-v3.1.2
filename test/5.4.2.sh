#!/bin/bash
# ** AUTO GENERATED **

# 5.3.2 - Ensure lockout for failed password attempts is configured (Scored)

# cat /etc/pam.d/password-auth | grep -E "auth\s*required\s*pam_faillock.so" || exit $?
# cat /etc/pam.d/password-auth | grep -E "auth\s*\[success=1\s*default=bad\]\s*pam_unix.so" || exit $?
# cat /etc/pam.d/password-auth | grep -E "auth\s*\[default=die\]\s*pam_faillock.so" ||exit $?
# cat /etc/pam.d/password-auth | grep -E "auth\s*sufficient\s*pam_faillock.so" || exit $?

# cat /etc/pam.d/system-auth | grep -E "auth\s*required\s*pam_faillock.so" || exit $?
# cat /etc/pam.d/system-auth | grep -E "auth\s*\[success=1\s*default=bad\]\s*pam_unix.so" || exit $?
# cat /etc/pam.d/system-auth | grep -E "auth\s*\[default=die\]\s*pam_faillock.so" ||exit $?
# cat /etc/pam.d/system-auth | grep -E "auth\s*sufficient\s*pam_faillock.so" || exit $?

# 定义需要在文件中搜索的字符串
auth_str1="auth\s+required\s+pam_faillock\.so\s+preauth\s+silent\s+audit\s+deny=5\s+unlock_time=900"
auth_str2="auth\s+sufficient\s+pam_unix\.so\s+nullok\s+try_first_pass"
auth_str3="auth\s+\[default=die\]\s+pam_faillock\.so\s+authfail\s+audit\s+deny=5\s+unlock_time=900"
account_str="account\s+required\s+pam_faillock\.so"

# 检查system-auth文件
grep -Pq "$auth_str1" /etc/pam.d/system-auth || exit 1
grep -Pq "$auth_str2" /etc/pam.d/system-auth || exit 1
grep -Pq "$auth_str3" /etc/pam.d/system-auth || exit 1
grep -Pq "$account_str" /etc/pam.d/system-auth || exit 1

# 检查password-auth文件
grep -Pq "$auth_str1" /etc/pam.d/password-auth || exit 1
grep -Pq "$auth_str2" /etc/pam.d/password-auth || exit 1
grep -Pq "$auth_str3" /etc/pam.d/password-auth || exit 1
grep -Pq "$account_str" /etc/pam.d/password-auth || exit 1

# 如果所有的检查都通过了，那么退出状态码为0
exit 0

