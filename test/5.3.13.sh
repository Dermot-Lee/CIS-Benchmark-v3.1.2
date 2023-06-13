#!/bin/bash
# ** AUTO GENERATED **

# 5.3.13 - Ensure only strong Ciphers are used (Scored)

# Step 1
output1=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*ciphers\s+([^#]+,)?(3descbc|aes128-cbc|aes192-cbc|aes256cbc|arcfour|arcfour128|arcfour256|blowfishcbc|cast128-cbc|rijndael-cbc@lysator.liu.se)\b')

if [[ -n $output1 ]]; then
    exit 1
fi

# Step 2
output2=$(grep -Ei '^\s*ciphers\s+([^#]+,)?(3des-cbc|aes128-cbc|aes192-cbc|aes256-cbc|arcfour|arcfour128|arcfour256|blowfish-cbc|cast128-cbc|rijndaelcbc@lysator.liu.se)\b' /etc/ssh/sshd_config)

if [[ -n $output2 ]]; then
    exit 1
fi

exit 0
