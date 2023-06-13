#!/bin/bash
# ** AUTO GENERATED **

# 1.4.2 - Ensure bootloader password is set (Scored)

# grep "^GRUB2_PASSWORD" /boot/grub2/user.cfg || exit $?

# cat /boot/grub2/user.cfg | grep "^GRUB2_PASSWORD" >/dev/null

userfile="/boot/grub2/user.cfg"

if [ -f "$userfile" ]; then
  if grep -Piq '^GRUB2_PASSWORD=' "$userfile"; then
    exit 0
  fi
fi

exit 1

