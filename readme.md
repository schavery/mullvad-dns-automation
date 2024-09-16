# Mullvad DNS Switcher

Automatically switches Mullvad VPN DNS settings based on your network.

## Quick Install

1. Save `mullvad_dns_switcher.sh` to `/Users/yourusername/scripts/`
   ```
   chmod +x /Users/yourusername/scripts/mullvad_dns_switcher.sh
   ```

2. Edit script: Set `HOME_SSID` and `HOME_DNS`

3. Save `com.yourusername.mullvaddnsswitcher.plist` to `/Users/yourusername/Library/LaunchAgents/`

4. Load:
   ```
   launchctl load /Users/yourusername/Library/LaunchAgents/com.yourusername.mullvaddnsswitcher.plist
   ```

## Uninstall

```
launchctl unload /Users/yourusername/Library/LaunchAgents/com.yourusername.mullvaddnsswitcher.plist
rm /Users/yourusername/Library/LaunchAgents/com.yourusername.mullvaddnsswitcher.plist
rm /Users/yourusername/scripts/mullvad_dns_switcher.sh
```

Replace `yourusername` with your macOS username.

