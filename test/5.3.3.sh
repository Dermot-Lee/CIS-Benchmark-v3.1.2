#!/bin/bash
# ** AUTO GENERATED **

# 5.3.3 - Ensure permissions on SSH public host key files are configured (Scored)

incorrect_permissions=0

# 找到所有的公钥文件
public_key_files=$(find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub')

for file in $public_key_files
do
  # 获取文件权限
  permissions=$(stat -c %A $file)
  
  # 检查组和其他用户是否有写入或执行权限
  if [[ $permissions != "-rw-r--r--" ]]; then
    echo "Incorrect permissions on $file"
    incorrect_permissions=1
  fi
done

exit $incorrect_permissions

