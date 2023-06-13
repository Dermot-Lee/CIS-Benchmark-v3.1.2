#!/bin/bash
# ** AUTO GENERATED **

# 3.5.2.10 - EEnsure nftables service is enabled (Not Scored)

if [[ $(systemctl is-enabled nftables) == "enabled" ]]; then
    exit 0
else
    exit 1
fi
