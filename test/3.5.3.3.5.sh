#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.3.5 - Ensure ip6tables rules are saved (Not Scored)

#!/bin/bash

# Check if the file exists and is not empty
if [[ -s /etc/sysconfig/ip6tables ]]; then
    exit 0
else
    exit 1
fi

