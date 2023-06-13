#!/bin/sh
# ** AUTO GENERATED **

# 1.1.2 - Ensure /tmp is configured (Scored)

# 1. 如果使用 systemd 的 tmp.mount 文件，运行命令 'systemctl show "tmp.mount" | grep -i unitfilestate' 并验证 tmp.mount 是否启用。
# 如果输出包含 'UnitFileState=enabled'，则退出脚本，否则继续到下一项检查。
# systemctl show "tmp.mount" | grep -i 'unitfilestate' || exit 0

# 2. 如果使用 /etc/fstab，运行命令 'grep -E '\s/tmp\s' /etc/fstab | grep -E -v '^\s*#' 并验证 tmpfs 是否被挂载到 tmpfs，或者为 /tmp 创建了一个系统分区。
# 如果输出包含 'tmpfs /tmp tmpfs defaults,noexec,nosuid,nodev 0 0'，则退出脚本，否则继续到下一项检查。
# grep -E '\s/tmp\s' /etc/fstab | grep -E -v '^\s*#' | grep 'tmpfs /tmp tmpfs defaults,noexec,nosuid,nodev 0 0' || exit 0

# 3. 运行命令 'findmnt -n /tmp' 并检查输出是否显示 /tmp 到 tmpfs 或者一个系统分区。
# 如果输出包含 '/tmp tmpfs tmpfs rw,nosuid,nodev,noexec'，则退出脚本，否则以错误退出。
# findmnt -n /tmp | grep '/tmp tmpfs tmpfs rw,nosuid,nodev,noexec' || exit $?


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
check1=`systemctl show "tmp.mount" | grep -i unitfilestate`

# 检查2
check2=`grep -E '\s/tmp\s' /etc/fstab | grep -E -v '^\s*#'`

# 检查3
check3=`findmnt -n /tmp`

# 判断是否满足条件1或条件2，同时满足条件3
if [[ $check1 == *"UnitFileState=enabled"* ]] || contains_all "$check2" "tmpfs" "/tmp" "tmpfs" "defaults" "noexec" "nosuid" "nodev"; then
  if contains_all "$check3" "/tmp" "tmpfs" "tmpfs" "rw" "nosuid" "nodev" "noexec"; then
    exit 0
  fi
fi

exit 1


