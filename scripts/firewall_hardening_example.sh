#!/usr/bin/env bash
#
# Example: conservative firewall hardening for macOS.
# Inbound-only. The Application Firewall does not filter outbound traffic.
# Review every line before running. Run as root:
#   sudo ./firewall_hardening_example.sh
#
# The legacy com.apple.alf property list no longer exists on macOS 15 Sequoia
# and later, so socketfilterfw is the only supported interface.

set -euo pipefail

FW=/usr/libexec/ApplicationFirewall/socketfilterfw

if [ "$(id -u)" -ne 0 ]; then
  echo "[!] Run this script as root: sudo $0"
  exit 1
fi

echo "[*] Enabling Application Firewall..."
"$FW" --setglobalstate on

echo "[*] Enabling firewall logging..."
"$FW" --setloggingmode on

echo "[*] Enabling stealth mode (ignore unsolicited probes such as ICMP)..."
"$FW" --setstealthmode on

# Leave automatic allow for signed software ENABLED on a standard workstation.
# Disabling it (below) tightens inbound control, but on macOS 15 Sequoia and
# later it commonly breaks app and browser connectivity, and the failures look
# like network problems rather than firewall rules. Uncomment only if you
# understand the tradeoff and have tested on a non-primary machine.
#
# echo "[*] Disabling automatic allow for signed code (ADVANCED, high-friction)..."
# "$FW" --setallowsigned off
# "$FW" --setallowsignedapp off
#
# Rollback if anything stops connecting:
# "$FW" --setallowsigned on
# "$FW" --setallowsignedapp on

echo "[*] Current firewall state:"
"$FW" --getglobalstate --getblockall --getallowsigned --getstealthmode

echo "[*] Done. Verify app and browser connectivity manually before trusting the result."
