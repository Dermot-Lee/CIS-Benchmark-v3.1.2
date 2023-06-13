#!/bin/sh
# ** AUTO GENERATED **

# 5.4.1.5 - Ensure all users last password change date is in the past (Scored)

# 获取当前日期
current_date=$(date +%s)

# 遍历/etc/shadow文件中的每个用户
for usr in $(cut -d: -f1 /etc/shadow); do
    # 使用chage命令获取用户的最后密码更改日期
    last_password_change=$(chage --list $usr | grep '^Last password change' | cut -d: -f2)

    # 将日期转换为秒，以便进行比较
    last_password_change_in_seconds=$(date -d"$last_password_change" +%s)

    # 如果用户的最后密码更改日期大于当前日期，退出并返回1
    if (( last_password_change_in_seconds > current_date )); then
        exit 1
    fi
done

# 如果所有用户的密码更改日期都早于或等于当前日期，返回0
exit 0

