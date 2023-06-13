#!/bin/bash
# ** AUTO GENERATED **

# 5.3.1 - Ensure password creation requirements are configured (Scored)

# grep pam_cracklib.so /etc/pam.d/password-auth | grep -E "try_first_pass\s*retry=3\s*minlen=8" || exit $1

# grep pam_cracklib.so /etc/pam.d/system-auth | grep -E "try_first_pass\s*retry=3\s*minlen=8" || exit $1

# Get password quality settings
minlen=$(grep '^\s*minlen\s*' /etc/security/pwquality.conf | awk '{print $NF}')
minclass=$(grep '^\s*minclass\s*' /etc/security/pwquality.conf | awk '{print $NF}')

# Get credit settings
dcredit=$(grep '^\s*dcredit\s*' /etc/security/pwquality.conf | awk '{print $NF}')
ucredit=$(grep '^\s*ucredit\s*' /etc/security/pwquality.conf | awk '{print $NF}')
lcredit=$(grep '^\s*lcredit\s*' /etc/security/pwquality.conf | awk '{print $NF}')
ocredit=$(grep '^\s*ocredit\s*' /etc/security/pwquality.conf | awk '{print $NF}')

# Check if the requirements are met
if [[ $minlen -lt 14 || $minclass -lt 4 ]]; then
    exit 1
fi

if [[ $dcredit -ge 0 || $ucredit -ge 0 || $lcredit -ge 0 || $ocredit -ge 0 ]]; then
    exit 1
fi

# Check the PAM settings
password_auth=$(grep -P '^\s*password\s+(?:requisite|required)\s+pam_pwquality\.so\s+(?:\S+\s+)*(?!\2)(retry=[1-3]|try_first_pass)\s+(?:\S+\s+)*(?!\1)(retry=[1-3]|try_first_pass)\s*(?:\s+\S+\s*)*(?:\s+#.*)?$' /etc/pam.d/password-auth)
system_auth=$(grep -P '^\s*password\s+(?:requisite|required)\s+pam_pwquality\.so\s+(?:\S+\s+)*(?!\2)(retry=[1-3]|try_first_pass)\s+(?:\S+\s+)*(?!\1)(retry=[1-3]|try_first_pass)\s*(?:\s+\S+\s*)*(?:\s+#.*)?$' /etc/pam.d/system-auth)

if [[ -z $password_auth || -z $system_auth ]]; then
    exit 1
fi

# If all checks pass, exit with a zero status code
exit 0

