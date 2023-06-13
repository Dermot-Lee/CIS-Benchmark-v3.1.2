#!/bin/bash
# ** AUTO GENERATED **

# 1.3.2 - Ensure filesystem integrity is regularly checked (Scored)

# Use the crontab command to get the root user's cron jobs
cron_job_result=$(crontab -l -u root | grep -E 'aide\s+--check')

# Check whether a suitable job was found
if [[ ! -z "$cron_job_result" ]]; then
    # If a job was found, exit with 0
    exit 0
else
    # If no job was found, exit with 1
    exit 1
fi

