#!/bin/bash

# Extend PATH to include common locations for Mullvad
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

HOME_SSID="Your_Home_SSID"
HOME_DNS="Your_Home_DNS_IP"

# Function to get current SSID
get_ssid() {
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
}

# Function to get current IPv4 address
get_ipv4() {
    scutil --nwi | awk '/IPv4/ {getline; print $3}'
}

# Function to set DNS
set_dns() {
    current_ssid=$(get_ssid)
    if [ "$current_ssid" == "$HOME_SSID" ]; then
        echo "Connected to home network. Setting custom DNS."
        mullvad dns set custom $HOME_DNS
    else
        echo "Not on home network. Setting default DNS."
        mullvad dns set default
    fi
}

# Check if Mullvad is installed
if ! command -v mullvad &> /dev/null; then
    echo "Mullvad VPN is not installed or not in PATH. Exiting."
    exit 1
fi

# Initial DNS setting
set_dns

# Initial IP address
old_ip=$(get_ipv4)

while true; do
    sleep 5
    new_ip=$(get_ipv4)
    if [ "$old_ip" != "$new_ip" ]; then
        echo "Network change detected. Updating DNS."
        set_dns
        old_ip=$new_ip
    fi
done
