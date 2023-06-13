#!/bin/bash
# ** AUTO GENERATED **

# 5.2.12 - Ensure SSH Idle Timeout Interval is configured (Scored)

# Get clientaliveinterval and clientalivecountmax from the sshd config
clientaliveinterval=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientaliveinterval | awk '{print $2}')
clientalivecountmax=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientalivecountmax | awk '{print $2}')

# Check if clientaliveinterval is between 1 and 900
if [[ $clientaliveinterval -ge 1 && $clientaliveinterval -le 900 ]]; then
    clientaliveinterval_check=0
else
    clientaliveinterval_check=1
fi

# Check if clientalivecountmax is 0
if [[ $clientalivecountmax -eq 0 ]]; then
    clientalivecountmax_check=0
else
    clientalivecountmax_check=1
fi

# Check if there are any lines in the sshd_config that match the provided patterns
clientaliveinterval_pattern_check=$(grep -Ei '^\s*ClientAliveInterval\s+(0|9[0-9][1-9]|[1-9][0-9][0-9][0-9]+|1[6-9]m|[2-9][0-9]m|[1-9][0-9][0-9]+m)\b' /etc/ssh/sshd_config | wc -l)
clientalivecountmax_pattern_check=$(grep -Ei '^\s*ClientAliveCountMax\s+([1-9]|[1-9][0-9]+)\b' /etc/ssh/sshd_config | wc -l)

# If any of the checks fail, exit with a non-zero status code
if [[ $clientaliveinterval_check -eq 1 || $clientalivecountmax_check -eq 1 || $clientaliveinterval_pattern_check -gt 0 || $clientalivecountmax_pattern_check -gt 0 ]]; then
    exit 1
fi

# If all checks pass, exit with a zero status code
exit 0


