#!/bin/sh
# ** AUTO GENERATED **

# 1.1.6 - Ensure /dev/shm is configured (Scored)

# 1. 运行命令 'findmnt -n /dev/shm' 并验证 /dev/shm 是否已被挂载。
# 如果输出包含 'tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,seclabel)'，则退出脚本，否则继续到下一项检查。
# findmnt -n /dev/shm | grep -q '/dev/shm tmpfs' && exit 0

# 2. 运行命令 'grep -E '\s/dev/shm\s' /etc/fstab' 并验证 /etc/fstab 中存在一个 /dev/shm 的条目。
# 如果输出包含 'tmpfs /dev/shm tmpfs defaults,noexec,nodev,nosuid 0 0'，则退出脚本，否则以错误退出。
# grep -E '\s/dev/shm\s' /etc/fstab | grep -q 'tmpfs /dev/shm tmpfs defaults,noexec,nodev,nosuid' || exit $?
#!/bin/bash

# 检查字符串中是否包含所有的关键词
contains_all() {
  string="$1"
  shift
  for kw in "$@"; do
    if [[ "$string" != *"$kw"* ]]; then
      return 1
    fi
  done
  return 0
}

# 检查1
check1=`findmnt -n /dev/shm`

# 检查2
check2=`grep -E '\s/dev/shm\s' /etc/fstab`

# 判断是否满足条件1和条件2
if contains_all "$check1" "/dev/shm" "tmpfs"  && contains_all "$check2" "tmpfs" "/dev/shm" "tmpfs" "defaults" "noexec" "nodev" "nosuid"; then
    exit 0
fi

exit 1


