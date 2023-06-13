#!/bin/sh
# ** AUTO GENERATED **

# 5.3.15 - Ensure only strong Key Exchange algorithms are used (Scored)

#!/bin/bash

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*kexalgorithms\s+([^#]+,)?(diffie-hellman-group1-sha1|diffie-hellmangroup14-sha1|diffie-hellman-group-exchange-sha1)\b')

if [[ -n $output1 ]]; then
    exit 1
fi

# Step 2
output2=$(grep -Ei '^\s*kexalgorithms\s+([^#]+,)?(diffie-hellman-group1-sha1|diffiehellman-group14-sha1|diffie-hellman-group-exchange-sha1)\b' /etc/ssh/sshd_config)

if [[ -n $output2 ]]; then
    exit 1
else
    exit 0
fi

