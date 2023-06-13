#!/bin/bash

# 使用stat命令获取/etc/passwd文件的权限和所有者信息
file_info=$(stat -c "%a %u %g" /etc/passwd)

# 分离权限、用户ID和组ID
file_perm=$(echo $file_info | cut -d ' ' -f1)
file_uid=$(echo $file_info | cut -d ' ' -f2)
file_gid=$(echo $file_info | cut -d ' ' -f3)

# 判断权限是否为644或更严格，用户ID和组ID是否为0
if [[ $file_perm -le 644 && $file_uid -eq 0 && $file_gid -eq 0 ]]; then
    exit 0
else
    exit 1
fi

