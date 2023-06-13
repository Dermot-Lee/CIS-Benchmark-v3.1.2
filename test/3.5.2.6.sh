#!/bin/bash
# ** AUTO GENERATED **

# 3.5.2.6 - Ensure nftables base chains exist (Not Scored)

output1=$(nft list ruleset | grep 'hook input')
output2=$(nft list ruleset | grep 'hook forward')
output3=$(nft list ruleset | grep 'hook output')

if [[ $output1 == *"type filter hook "* ]]; then
    if [[ $output2 == *"type filter hook"* ]]; then
        if [[ $output2 == *"type filter hook"* ]]; then
            exit 0
        else
            exit 1
        fi
    else
        exit 1
    fi
else
    exit 1
fi


