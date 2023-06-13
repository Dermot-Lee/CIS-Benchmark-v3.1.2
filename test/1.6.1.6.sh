#!/bin/bash
# ** AUTO GENERATED **

# 1.6.1.6 - Ensure no unconfined daemons exist (Scored)

output=$(ps -eZ | grep unconfined_service_t)

if [[ -z "$output" ]]; then
    exit 0
else
    exit 1
fi