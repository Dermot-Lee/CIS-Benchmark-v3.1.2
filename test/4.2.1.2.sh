#!/bin/sh
# ** AUTO GENERATED **

# 4.2.1.2 - Ensure rsyslog Service is enabled and running (Not Scored)

#!/bin/bash

if [[ $(systemctl is-enabled rsyslog) == "enabled" ]] && $(systemctl status rsyslog | grep -q 'active (running) '); then
    exit 0
else
    exit 1
fi

