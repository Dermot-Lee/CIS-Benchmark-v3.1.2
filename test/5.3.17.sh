#!/bin/bash
# ** AUTO GENERATED **

# 5.2.17 - Ensure SSH LoginGraceTime is set to one minute or less (Scored)

# 运行第一个命令并获取其输出
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep logingracetime)

# 运行第二个命令并获取其输出
output2=$(grep -Ei '^\s*LoginGraceTime\s+(0|6[1-9]|[7-9][0-9]|[1-9][0-9][0-9]+|[^1]m)' /etc/ssh/sshd_config)

# 检查第一个命令的输出
if [[ "$output1" != "logingracetime 60" ]]; then
  exit 1
fi

# 检查第二个命令的输出
if [[ "$output2" != "" ]]; then
  exit 1
fi

# 如果两个命令的输出都正确，退出状态码为0
exit 0

