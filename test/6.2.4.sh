#!/bin/bash
# ** AUTO GENERATED **

# 6.2.4 - Ensure shadow group is empty (Scored)

# 运行第一个命令，检查是否有用户被分配到shadow组
shadow_group_members=$(awk -F: '($1=="shadow") {print $NF}' /etc/group)

# 如果有任何结果被返回，退出并返回1
if [[ ! -z "$shadow_group_members" ]]; then
    exit 1
fi

# 获取shadow组的GID
shadow_gid=$(awk -F: '($1=="shadow") {print $3}' /etc/group)

# 运行第二个命令，检查是否有用户的默认组设置为shadow
shadow_gid_users=$(awk -F: -v GID="$shadow_gid" '($4==GID) {print $1}' /etc/passwd)

# 如果有任何结果被返回，退出并返回1
if [[ ! -z "$shadow_gid_users" ]]; then
    exit 1
fi

# 如果两个命令都没有返回任何结果，返回0
exit 0

