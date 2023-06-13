#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.5 - Ensure an nftables table exists (Not Scored)

output=$(nft list tables)

if [[ $output == *"table inet "* ]]; then
    exit 0
else
    exit 1
fi

