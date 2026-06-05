#!/usr/bin/env bash
#
# Example: enable the OpenBSM audit subsystem (auditd) on macOS that still
# supports it. This is advanced and optional, not a baseline control.
#
# Status: auditd is deprecated since macOS 11, disabled by default since
# macOS 14, and still disabled through macOS 15 Sequoia and macOS 26 Tahoe.
# Apple has stated it will be removed in a future release; the documented
# replacement is the Endpoint Security framework. Prefer Unified Logging for
# routine visibility.
#
# Misconfiguring auditd on recent macOS has caused login loops. Test on a
# non-primary machine first. Run as root:
#   sudo ./audit_enable_example.sh

set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "[!] Run this script as root: sudo $0"
  exit 1
fi

if [ ! -f /etc/security/audit_control ]; then
  echo "[*] Creating /etc/security/audit_control from the example..."
  cp /etc/security/audit_control.example /etc/security/audit_control
fi

echo "[*] Enabling the auditd service (modern syntax)..."
launchctl enable system/com.apple.auditd

echo
echo "[*] A reboot is required for auditd to start."
echo "    After rebooting, verify with:"
echo "      sudo launchctl print system/com.apple.auditd | grep -i state"
echo "      launchctl list | grep com.apple.auditd"
echo "      ls -la /var/audit"
echo
echo "[*] Not rebooting automatically. Reboot manually when ready: sudo reboot"
