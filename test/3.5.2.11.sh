#!/bin/bash
# ** AUTO GENERATED **

# 3.5.2.11 - Ensure nftables rules are permanent (Not Scored)

# 检查nftables配置文件是否存在
if [[ -f /etc/nftables.conf ]]; then
  # 如果存在，检查文件是否有内容
  if [[ -s /etc/nftables.conf ]]; then
    # 如果有内容，返回0
    exit 0
  else
    # 如果没有内容，返回1
    exit 1
  fi
else
  # 如果文件不存在，返回1
  exit 1
fi

