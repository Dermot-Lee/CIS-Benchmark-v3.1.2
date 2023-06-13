#!/bin/bash

# 检查 IPv4 设置
ipv4_accept_source_route_all=$(sysctl -n net.ipv4.conf.all.accept_source_route)
ipv4_accept_source_route_default=$(sysctl -n net.ipv4.conf.default.accept_source_route)

if [[ "${ipv4_accept_source_route_all}" -ne 0 ]] || [[ "${ipv4_accept_source_route_default}" -ne 0 ]]; then
    exit 1
fi

# 检查 IPv6 是否启用
ipv6_disabled=$(sysctl -n net.ipv6.conf.all.disable_ipv6)

if [[ "${ipv6_disabled}" -ne 1 ]]; then
    # 如果启用了 IPv6，检查相关设置
    ipv6_accept_source_route_all=$(sysctl -n net.ipv6.conf.all.accept_source_route)
    ipv6_accept_source_route_default=$(sysctl -n net.ipv6.conf.default.accept_source_route)
    
    if [[ "${ipv6_accept_source_route_all}" -ne 0 ]] || [[ "${ipv6_accept_source_route_default}" -ne 0 ]]; then
        exit 1
    fi
fi

exit 0

