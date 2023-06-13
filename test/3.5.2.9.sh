#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.9 - Ensure nftables default deny firewall policy (Not Scored)

#!/bin/bash

# 第一个命令
out1=$(nft list ruleset | grep 'hook input')
if [[ -z "$out1" ]]; then
  exit 1
fi

# 第二个命令
out2=$(nft list ruleset | grep 'hook forward')
if [[ -z "$out2" ]]; then
  exit 1
fi

# 第三个命令
out3=$(nft list ruleset | grep 'hook output')
if [[ -z "$out3" ]]; then
  exit 1
fi

# 如果所有命令都有输出，则返回0
exit 0

