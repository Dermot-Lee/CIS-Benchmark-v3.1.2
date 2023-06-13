#!/bin/bash
# ** AUTO GENERATED **

# 3.5.2.7 - Ensure nftables loopback traffic is configured (Not Scored)


# 第一个命令
out1=$(nft list ruleset | awk '/hook input/,/}/' | grep 'iif "lo" accept')
if [[ -z "$out1" ]]; then
  exit 1
fi

# 第二个命令
out2=$(nft list ruleset | awk '/hook input/,/}/' | grep 'ip saddr')
if [[ -z "$out2" ]]; then
  exit 1
fi

# 第三个命令
out3=$(nft list ruleset | awk '/hook input/,/}/' | grep 'ip6 saddr')
if [[ -z "$out3" ]]; then
  exit 1
fi

# 如果所有命令都有输出，则返回0
exit 0

