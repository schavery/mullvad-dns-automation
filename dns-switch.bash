#!/bin/bash

HOME_SSID="Center for Excellence, inc."
HOME_DNS="192.168.101.100"

# Check if Mullvad is installed
if ! command -v mullvad &> /dev/null; then
    echo "Mullvad VPN is not installed or not in PATH. Exiting."
    exit 1
fi

# Get current SSID
current_ssid=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')

# Set DNS based on current network
if [ "$current_ssid" == "$HOME_SSID" ]; then
    echo "Connected to home network. Setting custom DNS."
    mullvad dns set custom $HOME_DNS
else
    echo "Not on home network. Setting default DNS."
    mullvad dns set default
fi

