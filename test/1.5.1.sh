#!/bin/bash
# ** AUTO GENERATED **

# 1.5.1 - Ensure core dumps are restricted (Scored)

# Check if 'core' limit is set to 0
if ! grep -E "^\s*\*\s+hard\s+core\s+0" /etc/security/limits.conf /etc/security/limits.d/* >/dev/null 2>&1; then
    exit 1
fi

# Check if 'fs.suid_dumpable' is set to 0
if sysctl fs.suid_dumpable | grep -q "fs.suid_dumpable = 0"; then
    if ! grep -E "fs\.suid_dumpable\s*=\s*0" /etc/sysctl.conf >/dev/null 2>&1; then
        exit 1
    fi
else
    exit 1
fi

exit 0

