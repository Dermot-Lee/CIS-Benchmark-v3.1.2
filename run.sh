#!/bin/bash

# 定义颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# 定义计数变量
server1_pass_count=0
server1_fail_count=0
server1_skip_count=0
server1_manual_count=0

server2_pass_count=0
server2_fail_count=0
server2_skip_count=0
server2_manual_count=0

# 在脚本开始处定义变量
last_script_status=0

# 定义执行脚本的函数
execute_script() {
    script_number=$1
    script_description=$2
    server=$3
    workstation=$4
    mode=$5

    # 如果模式是Manual，则跳过检查
    if [ "$mode" = "Manual" ]; then
        printf "${WHITE}MANU${NC} - Script ${script_number} - ${script_description}\n"
        if [ "$server" = "Server1" ]; then
            server1_manual_count=$((server1_manual_count + 1))
        elif [ "$server" = "Server2" ]; then
            server2_manual_count=$((server2_manual_count + 1))
        fi
        return
    fi

    # 尝试执行脚本并捕获返回状态
    script_path="./test/${script_number}.sh"
    if [ -f "$script_path" ]; then
        bash $script_path $server $workstation $mode > /dev/null 2>/dev/null
        status=$?
        # 更新last_script_status变量
        last_script_status=$status
        if [ "$status" -eq 0 ]; then
            printf "${GREEN}PASS${NC} - Script ${script_number} - ${script_description}\n"
            if [ "$server" = "Server1" ]; then
                server1_pass_count=$((server1_pass_count + 1))
            elif [ "$server" = "Server2" ]; then
                server2_pass_count=$((server2_pass_count + 1))
            fi
        else
            printf "${RED}FAIL${NC} - Script ${script_number} - ${script_description}\n"
            if [ "$server" = "Server1" ]; then
                server1_fail_count=$((server1_fail_count + 1))
            elif [ "$server" = "Server2" ]; then
                server2_fail_count=$((server2_fail_count + 1))
            fi
        fi
    else
        printf "${YELLOW}SKIP${NC} - Script ${script_number} - ${script_description}\n"
        if [ "$server" = "Server1" ]; then
            server1_skip_count=$((server1_skip_count + 1))
        elif [ "$server" = "Server2" ]; then
            server2_skip_count=$((server2_skip_count + 1))
        fi
    fi
}

# 调用函数执行脚本
execute_script 1.1.1.1 "Ensure mounting of cramfs filesystems is disabled (Automated)" Server1 Workstation1 Auto
execute_script 1.1.1.3 "Ensure mounting of udf filesystems is disabled (Automated)" Server1 Workstation1 Auto
execute_script 1.1.2 "Ensure /tmp is configured (Automated)" Server1 Workstation1 Auto
execute_script 1.1.3 "Ensure noexec option set on /tmp partition (Automated)" Server1 Workstation1 Auto
execute_script 1.1.4 "Ensure nodev option set on /tmp partition (Automated)" Server1 Workstation1 Auto
execute_script 1.1.5 "Ensure nosuid option set on /tmp partition (Automated)" Server1 Workstation1 Auto
execute_script 1.1.6 "Ensure /dev/shm is configured (Automated)" Server1 Workstation1 Auto
execute_script 1.1.7 "Ensure noexec option set on /dev/shm partition (Automated)" Server1 Workstation1 Auto
execute_script 1.1.8 "Ensure nodev option set on /dev/shm partition (Automated)" Server1 Workstation1 Auto
execute_script 1.1.9 "Ensure nosuid option set on /dev/shm partition (Automated)" Server1 Workstation1 Auto
execute_script 1.1.12 "Ensure /var/tmp partition includes the noexec option (Automated)" Server1 Workstation1 Auto
execute_script 1.1.13 "Ensure /var/tmp partition includes the nodev option (Automated)" Server1 Workstation1 Auto
execute_script 1.1.14 "Ensure /var/tmp partition includes the nosuid option (Automated)" Server1 Workstation1 Auto
execute_script 1.1.18 "Ensure /home partition includes the nodev option (Automated)" Server1 Workstation1 Auto
execute_script 1.1.19 "Ensure removable media partitions include noexec option (Automated)" Server1 Workstation1 Auto
execute_script 1.1.20 "Ensure nodev option set on removable media partitions (Automated)" Server1 Workstation1 Auto
execute_script 1.1.21 "Ensure nosuid option set on removable media partitions (Automated)" Server1 Workstation1 Auto
execute_script 1.1.22 "Ensure sticky bit is set on all world-writable directories (Automated)" Server1 Workstation1 Auto
execute_script 1.1.23 "Disable Automounting (Automated,1,2)" Server1 Workstation2 Auto
execute_script 1.1.24  "Disable USB Storage (Automated,1,2)" Server1 Workstation2 Auto
execute_script 1.2.1 "Ensure GPG keys are configured (Manual)" Server1 Workstation1 Manual
execute_script 1.2.2 "Ensure package manager repositories are configured (Manual)" Server1 Workstation1 Manual
execute_script 1.2.3 "Ensure gpgcheck is globally activated (Automated)" Server1 Workstation1 Auto
execute_script 1.3.1 "Ensure AIDE is installed (Automated)" Server1 Workstation1 Auto
execute_script 1.3.2 "Ensure filesystem integrity is regularly checked (Automated)" Server1 Workstation1 Auto
execute_script 1.4.1 "Ensure bootloader password is set (Automated)" Server1 Workstation1 Auto
execute_script 1.4.2 "Ensure permissions on bootloader config are configured (Automated)" Server1 Workstation1 Auto
execute_script 1.4.3 "Ensure authentication required for single user mode (Automated)" Server1 Workstation1 Auto
execute_script 1.5.1 "Ensure core dumps are restricted (Automated)" Server1 Workstation1 Auto
execute_script 1.5.2 "Ensure XD/NX support is enabled (Automated)" Server1 Workstation1 Auto
execute_script 1.5.3 "Ensure address space layout randomization (ASLR)is enabled (Automated)" Server1 Workstation1 Auto
execute_script 1.5.4 "Ensure prelink is not installed (Automated)" Server1 Workstation1 Auto
execute_script 1.6.1.1 "Ensure SELinux is installed (Automated)" Server1 Workstation1 Auto
execute_script 1.6.1.2 "Ensure SELinux is not disabled in bootloader configuration (Automated)" Server1 Workstation1 Auto
execute_script 1.6.1.3 "Ensure SELinux policy is configured (Automated)" Server1 Workstation1 Auto
execute_script 1.6.1.4 "Ensure the SELinux mode is enforcing or permissive (Manual)" Server1 Workstation1 Manual
execute_script 1.6.1.6 "Ensure no unconfined services exist (Automated)" Server1 Workstation1 Auto
execute_script 1.6.1.7 "Ensure SETroubleshoot is not installed (Automated)" Server1 Workstation1 Auto
execute_script 1.6.1.8 "Ensure the MCS Translation Service (mcstrans)is not installed (Automated)" Server1 Workstation1 Auto
execute_script 1.7.1 "Ensure message of the day is configured properly (Automated)" Server1 Workstation1 Auto
execute_script 1.7.2 "Ensure local login warning banner is configured properly (Automated)" Server1 Workstation1 Auto
execute_script 1.7.3 "Ensure remote login warning banner is configured properly (Automated)" Server1 Workstation1 Auto
execute_script 1.7.4 "Ensure permissions on /etc/motd are configured (Automated)" Server1 Workstation1 Auto
execute_script 1.7.5 "Ensure permissions on /etc/issue are configured (Automated)" Server1 Workstation1 Auto
execute_script 1.7.6 "Ensure permissions on /etc/issue.net are configured (Automated)" Server1 Workstation1 Auto
execute_script 1.8.1 "Ensure GNOME Display Manager is removed (Manual,2)" Server1 Workstation2 Manual
# 如果1.8.1执行成功，那么跳过执行1.8.2和1.8.3
if [ "$last_script_status" -ne 0 ]; then
    execute_script 1.8.2 "Ensure GDM login banner is configured (Automated)" Server1 Workstation1 Auto
    execute_script 1.8.3 "Ensure last logged in user display is disabled (Automated)" Server1 Workstation1 Auto
fi
execute_script 1.8.4 "Ensure XDCMP is not enabled (Automated)" Server1 Workstation1 Auto
execute_script 1.9 "Ensure updates, patches, and additional security software are installed (Manual)" Server1 Workstation1 Manual
execute_script 2.1.1 "Ensure xinetd is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.1.1 "Ensure time synchronization is in use (Automated)" Server1 Workstation1 Auto
if [ "$last_script_status" -eq 0 ]; then
    flag_chrony=$(cat /tmp/flag_chrony.txt)
    flag_ntp=$(cat /tmp/flag_ntp.txt)
    
    if [ "$flag_chrony" -eq 1 ]; then
        execute_script 2.2.1.2 "Ensure chrony is configured (Automated)" Server1 Workstation1 Auto
    fi
    if [ "$flag_ntp" -eq 1 ]; then
        execute_script 2.2.1.3 "Ensure ntp is configured (Automated)" Server1 Workstation1 Auto
    fi
fi

execute_script 2.2.2 "Ensure X11 Server components are not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.3 "Ensure Avahi Server is not installed (Automated,1,2)" Server1 Workstation2 Auto
execute_script 2.2.4 "Ensure CUPS is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.5 "Ensure DHCP Server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.6 "Ensure LDAP server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.7 "Ensure DNS Server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.8 "Ensure FTP Server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.9 "Ensure HTTP server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.10 "Ensure IMAP and POP3 server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.11 "Ensure Samba is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.12 "Ensure HTTP Proxy Server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.13 "Ensure net-snmp is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.14 "Ensure NIS server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.15 "Ensure telnet-server is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.2.16 "Ensure mail transfer agent is configured for local-only mode (Automated)" Server1 Workstation1 Auto
execute_script 2.2.17 "Ensure nfs-utils is not installed or the nfs-server service is masked (Automated)" Server1 Workstation1 Auto
execute_script 2.2.18 "Ensure rpcbind is not installed or the rpcbind services are masked (Automated)" Server1 Workstation1 Auto
execute_script 2.2.19 "Ensure rsync is not installed or the rsyncd service is masked (Automated)" Server1 Workstation1 Auto
execute_script 2.3.1 "Ensure NIS Client is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.3.2 "Ensure rsh client is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.3.3 "Ensure talk client is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.3.4 "Ensure telnet client is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.3.5 "Ensure LDAP client is not installed (Automated)" Server1 Workstation1 Auto
execute_script 2.4 "Ensure nonessential services are removed or masked (Manual)" Server1 Workstation1 Manual
execute_script 3.1.2 "Ensure wireless interfaces are disabled (Automated,1,2)" Server1 Workstation2 Auto
execute_script 3.2.1 "Ensure IP forwarding is disabled (Automated)" Server1 Workstation1 Auto
execute_script 3.2.2 "Ensure packet redirect sending is disabled (Automated)" Server1 Workstation1 Auto
execute_script 3.3.1 "Ensure source routed packets are not accepted (Automated)" Server1 Workstation1 Auto
execute_script 3.3.2 "Ensure ICMP redirects are not accepted (Automated)" Server1 Workstation1 Auto
execute_script 3.3.3 "Ensure secure ICMP redirects are not accepted (Automated)" Server1 Workstation1 Auto
execute_script 3.3.4 "Ensure suspicious packets are logged (Automated)" Server1 Workstation1 Auto
execute_script 3.3.5 "Ensure broadcast ICMP requests are ignored (Automated)" Server1 Workstation1 Auto
execute_script 3.3.6 "Ensure bogus ICMP responses are ignored (Automated)" Server1 Workstation1 Auto
execute_script 3.3.7 "Ensure Reverse Path Filtering is enabled (Automated)" Server1 Workstation1 Auto
execute_script 3.3.8 "Ensure TCP SYN Cookies is enabled (Automated)" Server1 Workstation1 Auto
execute_script 3.3.9 "Ensure IPv6 router advertisements are not accepted (Automated)" Server1 Workstation1 Auto
firewalld_result=$(rpm -q firewalld)
if [[ $firewalld_result == firewalld-* ]]; then
    execute_script 3.5.1.1 "Ensure firewalld is installed (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.1.2 "Ensure iptables-services not installed with firewalld (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.1.3 "Ensure nftables either not installed or masked with firewalld (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.1.4 "Ensure firewalld service enabled and running (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.1.5 "Ensure firewalld default zone is set (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.1.6 "Ensure network interfaces are assigned to appropriate zone (Manual)" Server1 Workstation1 Manual
    execute_script 3.5.1.7 "Ensure firewalld drops unnecessary services and ports (Manual)" Server1 Workstation1 Manual
fi
nftables_result=$(rpm -q nftables)
if [[ $nftables_result == nftables-* ]]; then
    execute_script 3.5.2.1 "Ensure nftables is installed (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.2 "Ensure firewalld is either not installed or masked with nftables (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.3 "Ensure iptables-services not installed with nftables (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.4 "Ensure iptables are flushed with nftables (Manual)" Server1 Workstation1 Manual
    execute_script 3.5.2.5 "Ensure an nftables table exists (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.6 "Ensure nftables base chains exist (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.7 "Ensure nftables loopback traffic is configured (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.8 "Ensure nftables outbound and established connections are configured (Manual)" Server1 Workstation1 Manual
    execute_script 3.5.2.9 "Ensure nftables default deny firewall policy (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.10 "Ensure nftables service is enabled (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.2.11 "Ensure nftables rules are permanent (Automated)" Server1 Workstation1 Auto
fi
iptables_result=$(rpm -q iptables-service)
if [[ $iptables_result == iptables-service* ]]; then
    execute_script 3.5.3.1.1 "Ensure iptables packages are installed (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.1.2 "Ensure nftables is not installed with iptables (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.1.3 "Ensure firewalld is either not installed or masked with iptables (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.2.1 "Ensure iptables loopback traffic is configured (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.2.2 "Ensure iptables outbound and established connections are configured (Manual)" Server1 Workstation1 Manual
    execute_script 3.5.3.2.3 "Ensure iptables rules exist for all open ports (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.2.4 "Ensure iptables default deny firewall policy (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.2.5 "Ensure iptables rules are saved (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.2.6 "Ensure iptables is enabled and running (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.3.1 "Ensure ip6tables loopback traffic is configured (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.3.2 "Ensure ip6tables outbound and established connections are configured (Manual)" Server1 Workstation1 Manual
    execute_script 3.5.3.3.3 "Ensure ip6tables firewall rules exist for all open ports (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.3.4 "Ensure ip6tables default deny firewall policy (Automated)" Server1 Workstation1 Auto
    execute_script 3.5.3.3.5 "Ensure ip6tables rules are saved (Automated).  " Server1 Workstation1 Auto
    execute_script 3.5.3.3.6 "Ensure ip6tables is enabled and running (Automated)" Server1 Workstation1 Auto
fi
execute_script 4.2.1.1 "Ensure rsyslog is installed (Automated)" Server1 Workstation1 Auto
if [ "$last_script_status" -eq 0 ]; then
    execute_script 4.2.1.2 "Ensure rsyslog Service is enabled and running (Automated)" Server1 Workstation1 Auto
    execute_script 4.2.1.3 "Ensure rsyslog default file permissions configured (Automated)" Server1 Workstation1 Auto
    execute_script 4.2.1.4 "Ensure logging is configured (Manual)" Server1 Workstation1 Manual
    execute_script 4.2.1.5 "Ensure rsyslog is configured to send logs to a remote log host (Manual)" Server1 Workstation1 Manual
    execute_script 4.2.1.6 "Ensure remote rsyslog messages are only accepted on designated log hosts. (Manual)" Server1 Workstation1 Manual
fi
execute_script 4.2.2.1 "Ensure journald is configured to send logs to rsyslog (Manual)" Server1 Workstation1 Manual
execute_script 4.2.2.2 "Ensure journald is configured to compress large log files (Automated)" Server1 Workstation1 Auto
execute_script 4.2.2.3 "Ensure journald is configured to write logfiles to persistent disk (Automated)" Server1 Workstation1 Auto
execute_script 4.2.3 "Ensure permissions on all logfiles are configured (Manual)" Server1 Workstation1 Manual
execute_script 4.2.4 "Ensure logrotate is configured (Manual)" Server1 Workstation1 Manual
execute_script 5.1.1 "Ensure cron daemon is enabled and running (Automated)" Server1 Workstation1 Auto
if [ "$last_script_status" -eq 0 ]; then
    execute_script 5.1.2 "Ensure permissions on /etc/crontab are configured (Automated)" Server1 Workstation1 Auto
    execute_script 5.1.3 "Ensure permissions on /etc/cron.hourly are configured (Automated)" Server1 Workstation1 Auto
    execute_script 5.1.4 "Ensure permissions on /etc/cron.daily are configured (Automated)" Server1 Workstation1 Auto
    execute_script 5.1.5 "Ensure permissions on /etc/cron.weekly are configured (Automated)" Server1 Workstation1 Auto
    execute_script 5.1.6 "Ensure permissions on /etc/cron.monthly are configured (Automated)" Server1 Workstation1 Auto
    execute_script 5.1.7 "Ensure permissions on /etc/cron.d are configured (Automated)" Server1 Workstation1 Auto
    execute_script 5.1.8 "Ensure cron is restricted to authorized users (Automated)" Server1 Workstation1 Auto
fi
at_result=$(rpm -q at)
if [[ $at_result == at-* ]]; then
    execute_script 5.1.9 "Ensure at is restricted to authorized users (Automated).36 " Server1 Workstation1 Auto
fi
execute_script 5.2.1 "Ensure sudo is installed (Automated)" Server1 Workstation1 Auto
execute_script 5.2.2 "Ensure sudo commands use pty (Automated)" Server1 Workstation1 Auto
execute_script 5.2.3 "Ensure sudo log file exists (Automated)" Server1 Workstation1 Auto

execute_script 5.3.1 "Ensure permissions on /etc/ssh/sshd_config are configured (Automated)" Server1 Workstation1 Auto
execute_script 5.3.2 "Ensure permissions on SSH private host key files are configured (Automated)" Server1 Workstation1 Auto
execute_script 5.3.3 "Ensure permissions on SSH public host key files are configured (Automated)" Server1 Workstation1 Auto
execute_script 5.3.4 "Ensure SSH access is limited (Manual)" Server1 Workstation1 Manual
execute_script 5.3.5 "Ensure SSH LogLevel is appropriate (Automated)" Server1 Workstation1 Auto
execute_script 5.3.7 "Ensure SSH MaxAuthTries is set to or less (Automated)" Server1 Workstation1 Auto
execute_script 5.3.8 "Ensure SSH IgnoreRhosts is enabled (Automated)" Server1 Workstation1 Auto
execute_script 5.3.9 "Ensure SSH HostbasedAuthentication is disabled (Automated)" Server1 Workstation1 Auto
execute_script 5.3.10 "Ensure SSH root login is disabled (Manual)" Server1 Workstation1 Manual
execute_script 5.3.11 "Ensure SSH PermitEmptyPasswords is disabled (Automated)" Server1 Workstation1 Auto
execute_script 5.3.12 "Ensure SSH PermitUserEnvironment is disabled (Automated)" Server1 Workstation1 Auto
execute_script 5.3.13 "Ensure only strong Ciphers are used (Automated)" Server1 Workstation1 Auto
execute_script 5.3.14 "Ensure only strong MAC algorithms are used (Automated)" Server1 Workstation1 Auto
execute_script 5.3.15 "Ensure only strong Key Exchange algorithms are used (Automated)" Server1 Workstation1 Auto
execute_script 5.3.16 "Ensure SSH Idle Timeout Interval is configured (Automated)" Server1 Workstation1 Auto
execute_script 5.3.17 "Ensure SSH LoginGraceTime is set to one minute or less (Automated)" Server1 Workstation1 Auto
execute_script 5.3.18 "Ensure SSH warning banner is configured (Automated)" Server1 Workstation1 Auto
execute_script 5.3.19 "Ensure SSH PAM is enabled (Automated)" Server1 Workstation1 Auto
execute_script 5.3.21 "Ensure SSH MaxStartups is configured (Automated)" Server1 Workstation1 Auto
execute_script 5.3.22 "Ensure SSH MaxSessions is limited (Automated)" Server1 Workstation1 Auto
execute_script 5.4.1 "Ensure password creation requirements are configured (Automated)" Server1 Workstation1 Auto
execute_script 5.4.2 "Ensure lockout for failed password attempts is configured (Automated)" Server1 Workstation1 Auto
execute_script 5.4.3 "Ensure password hashing algorithm is SHA-512 (Automated)" Server1 Workstation1 Auto
execute_script 5.4.4 "Ensure password reuse is limited (Automated)" Server1 Workstation1 Auto
execute_script 5.5.1.1 "Ensure password expiration is  days or less (Automated)" Server1 Workstation1 Auto
execute_script 5.5.1.2 "Ensure minimum days between password changes is configured (Automated)" Server1 Workstation1 Auto
execute_script 5.5.1.3 "Ensure password expiration warning days is  or more (Automated)" Server1 Workstation1 Auto
execute_script 5.5.1.4 "Ensure inactive password lock is  days or less (Automated)" Server1 Workstation1 Auto
execute_script 5.5.1.5 "Ensure all users last password change date is in the past (Automated)" Server1 Workstation1 Auto
execute_script 5.5.2 "Ensure system accounts are secured (Automated)" Server1 Workstation1 Auto
execute_script 5.5.3 "Ensure default group for the root account is GID  (Automated)" Server1 Workstation1 Auto
execute_script 5.5.4 "Ensure default user shell timeout is configured (Automated)" Server1 Workstation1 Auto
execute_script 5.5.5 "Ensure default user umask is configured (Automated)" Server1 Workstation1 Auto
execute_script 5.6 "Ensure root login is restricted to system console (Manual)" Server1 Workstation1 Manual
execute_script 5.7 "Ensure access to the su command is restricted (Automated)" Server1 Workstation1 Auto
execute_script 6.1.2 "Ensure permissions on /etc/passwd are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.3 "Ensure permissions on /etc/passwd- are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.4 "Ensure permissions on /etc/shadow are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.5 "Ensure permissions on /etc/shadow- are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.6 "Ensure permissions on /etc/gshadow- are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.7 "Ensure permissions on /etc/gshadow are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.8 "Ensure permissions on /etc/group are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.9 "Ensure permissions on /etc/group- are configured (Automated)" Server1 Workstation1 Auto
execute_script 6.1.10 "Ensure no world writable files exist (Automated)" Server1 Workstation1 Auto
execute_script 6.1.11 "Ensure no unowned files or directories exist (Automated)" Server1 Workstation1 Auto
execute_script 6.1.12 "Ensure no ungrouped files or directories exist (Automated)" Server1 Workstation1 Auto
execute_script 6.1.13 "Audit SUID executables (Manual)" Server1 Workstation1 Manual
execute_script 6.1.14 "Audit SGID executables (Manual)" Server1 Workstation1 Manual
execute_script 6.2.1 "Ensure accounts in /etc/passwd use shadowed passwords (Automated)" Server1 Workstation1 Auto
execute_script 6.2.2 "Ensure /etc/shadow password fields are not empty (Automated)" Server1 Workstation1 Auto
execute_script 6.2.3 "Ensure all groups in /etc/passwd exist in /etc/group (Automated)" Server1 Workstation1 Auto
execute_script 6.2.4 "Ensure shadow group is empty (Automated)" Server1 Workstation1 Auto
execute_script 6.2.5 "Ensure no duplicate user names exist (Automated)" Server1 Workstation1 Auto
execute_script 6.2.6 "Ensure no duplicate group names exist (Automated)" Server1 Workstation1 Auto
execute_script 6.2.7 "Ensure no duplicate UIDs exist (Automated)" Server1 Workstation1 Auto
execute_script 6.2.8 "Ensure no duplicate GIDs exist (Automated)" Server1 Workstation1 Auto
execute_script 6.2.9 "Ensure root is the only UID  account (Automated)" Server1 Workstation1 Auto
execute_script 6.2.10 "Ensure root PATH Integrity (Automated)" Server1 Workstation1 Auto
execute_script 6.2.11 "Ensure all users' home directories exist (Automated)" Server1 Workstation1 Auto
execute_script 6.2.12 "Ensure users own their home directories (Automated)" Server1 Workstation1 Auto
execute_script 6.2.13 "Ensure users' home directories permissions are  or more restrictive (Automated)" Server1 Workstation1 Auto
execute_script 6.2.14 "Ensure users' dot files are not group or world writable (Automated)" Server1 Workstation1 Auto
execute_script 6.2.15 "Ensure no users have .forward files (Automated)" Server1 Workstation1 Auto
execute_script 6.2.16 "Ensure no users have .netrc files (Automated)" Server1 Workstation1 Auto
execute_script 6.2.17 "Ensure no users have .rhosts files (Automated)" Server1 Workstation1 Auto
printf "\n------ ------- ------\n"
execute_script 1.1.1.2 "Ensure mounting of squashfs filesystems is disabled (Automated,2,2)" Server2 Workstation2 Auto
execute_script 1.1.10 "Ensure separate partition exists for /var (Automated,2,2)" Server2 Workstation2 Auto
execute_script 1.1.11 "Ensure separate partition exists for /var/tmp (Automated,2,2)" Server2 Workstation2 Auto
execute_script 1.1.15 "Ensure separate partition exists for /var/log (Automated,2,2)" Server2 Workstation2 Auto
execute_script 1.1.16 "Ensure separate partition exists for /var/log/audit (Automated,2,2)" Server2 Workstation2 Auto
execute_script 1.1.17 "Ensure separate partition exists for /home (Automated,2,2).  " Server2 Workstation2 Auto
execute_script 1.6.1.5 "Ensure the SELinux mode is enforcing (Automated,2,2)" Server2 Workstation2 Auto
execute_script 3.1.1 "Disable IPv6 (Manual,2,2)" Server2 Workstation2 Manual
execute_script 3.4.1 "Ensure DCCP is disabled (Automated,2,2)" Server2 Workstation2 Auto
execute_script 3.4.2 "Ensure SCTP is disabled (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.1.1 "Ensure auditd is installed (Automated,2,2).  " Server2 Workstation2 Auto
execute_script 4.1.1.2 "Ensure auditd service is enabled and running (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.1.3 "Ensure auditing for processes that start prior to auditd is enabled (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.2.1 "Ensure audit log storage size is configured (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.2.2 "Ensure audit logs are not automatically deleted (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.2.3 "Ensure system is disabled when audit logs are full (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.2.4 "Ensure audit_backlog_limit is sufficient (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.3 "Ensure events that modify date and time information are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.4 "Ensure events that modify user/group information are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.5 "Ensure events that modify the system's network environment are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.6 "Ensure events that modify the system's Mandatory Access Controls are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.7 "Ensure login and logout events are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.8 "Ensure session initiation information is collected (Automated,2,2).  " Server2 Workstation2 Auto
execute_script 4.1.9 "Ensure discretionary access control permission modification events are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.10 "Ensure unsuccessful unauthorized file access attempts are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.11 "Ensure use of privileged commands is collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.12 "Ensure successful file system mounts are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.13 "Ensure file deletion events by users are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.14 "Ensure changes to system administration scope (sudoers)is collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.15 "Ensure system administrator command executions (sudo)are collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.16 "Ensure kernel module loading and unloading is collected (Automated,2,2)" Server2 Workstation2 Auto
execute_script 4.1.17 "Ensure the audit configuration is immutable (Automated,2,2)" Server2 Workstation2 Auto
execute_script 5.3.6 "Ensure SSH X11 forwarding is disabled (Automated,2,2)" Server2 Workstation2 Auto
execute_script 5.3.20 "Ensure SSH AllowTcpForwarding is disabled (Automated,2,2)" Server2 Workstation2 Auto
execute_script 6.1.1 "Audit system file permissions (Manual,2,2)" Server2 Workstation2 Manual

# 输出统计结果
printf "\n------ Server 1 ------\n"
printf "Server1 Pass Count: ${GREEN}${server1_pass_count}${NC}\n"
printf "Server1 Fail Count: ${RED}${server1_fail_count}${NC}\n"
printf "Server1 Skip Count: ${YELLOW}${server1_skip_count}${NC}\n"
printf "Server1 Manual Count: ${WHITE}${server1_manual_count}${NC}\n"
printf "Server1 Total Count: $((${server1_pass_count} + ${server1_fail_count} + ${server1_skip_count} + ${server1_manual_count}))\n"
printf "\n------ Server 2 ------\n"
printf "Server2 Pass Count: ${GREEN}${server2_pass_count}${NC}\n"
printf "Server2 Fail Count: ${RED}${server2_fail_count}${NC}\n"
printf "Server2 Skip Count: ${YELLOW}${server2_skip_count}${NC}\n"
printf "Server2 Manual Count: ${WHITE}${server2_manual_count}${NC}\n"
printf "Server2 Total Count: $((${server2_pass_count} + ${server2_fail_count} + ${server2_skip_count} + ${server2_manual_count}))\n"

