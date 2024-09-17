# Mullvad DNS Switcher

Automatically switches Mullvad VPN DNS settings based on your 
network using `mullvad` cli.

## Requirements

- macOS
- Mullvad VPN client installed

## Installation

1. Edit script:
   - Open `mullvad_dns_switcher.bash`
   - Set `HOME_SSID` and `HOME_DNS`

1. Edit plist:
   - Replace path to the bash script

1. Move plist to launch agents::
   ```
   cp com.stevenavery.mullvaddnsswitcher ~/Library/LaunchAgents
   ```

1. Load launchd job:
   ```
   launchctl load ~/Library/LaunchAgents/com.stevenavery.mullvaddnsswitcher.plist
   ```

## Uninstall

```
launchctl unload ~/Library/LaunchAgents/com.stevenavery.mullvaddnsswitcher.plist
rm ~/Library/LaunchAgents/com.stevenavery.mullvaddnsswitcher.plist
```

## Troubleshooting

Check logs:
```
tail -f /tmp/mullvaddnsswitcher.log
```