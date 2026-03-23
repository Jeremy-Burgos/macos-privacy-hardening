# Quickstart

This repository is not meant to be applied all at once.

Use this file to choose a sane starting point based on the role of the machine and the level of friction you are willing to accept.

First, confirm what you are running:

```bash
sw_vers
uname -a
````

Then decide which baseline fits the machine.

## 1. Safe baseline

Use this path for:

* most personal Macs
* developer workstations
* day-to-day business systems
* users who want a stronger local baseline without major breakage

Recommended first steps:

1. review `THREAT_MODEL.md`
2. review `TESTED_ON.md`
3. verify package and app signatures before running third-party software
4. enable and tighten the built-in firewall
5. disable unnecessary remote access
6. enable FileVault
7. review XProtect and update posture
8. show filename extensions
9. review browser and VPN choices
10. become familiar with basic logging and process visibility

Suggested reading order:

* `docs/01-integrity-and-xprotect.md`
* `docs/03-firewall-and-networking.md`
* `docs/08-finder-ui-and-filevault.md`
* `docs/10-browsers-and-vpns.md`
* `docs/update-hygiene-and-background-security.md`

## 2. Defensive workstation

Use this path for:

* researchers
* administrators
* defenders
* users handling more sensitive data
* users who want better local visibility, not just blocking

Do everything in the Safe baseline, then add:

1. regular package and code-signature verification
2. launch agent and daemon review
3. DNS privacy setup
4. login-window and banner hardening
5. install log retention review
6. login items and background items review
7. privacy-permission review for security tooling
8. forensic visibility workflows

Suggested reading order:

* `docs/02-users-and-groups.md`
* `docs/04-dns-and-hosts.md`
* `docs/05-logging-and-auditing.md`
* `docs/07-loginwindow-and-banners.md`
* `docs/privacy-permissions-and-tcc.md`
* `docs/login-items-background-items-and-extensions.md`

## 3. High-risk hardening

Use this path for:

* users who believe they may be specifically targeted
* users handling highly sensitive investigations or material
* users willing to accept compatibility loss for tighter controls

Do everything in the Defensive workstation path, then consider:

1. Lockdown Mode
2. stronger browser separation
3. Tor Browser or Mullvad Browser for specific workflows
4. always-on VPN discipline
5. reduced trust in convenience features
6. tighter review of background items, extensions, and startup behavior
7. minimal software footprint
8. more aggressive update discipline

Suggested reading order:

* `docs/gatekeeper-and-notarization.md`
* `docs/login-items-background-items-and-extensions.md`
* `docs/update-hygiene-and-background-security.md`
* `docs/10-browsers-and-vpns.md`

## 4. Core operational rules

Regardless of profile:

1. do not apply controls you do not understand
2. verify every major change after applying it
3. keep rollback access for anything that affects login, firewalling, networking, or encryption
4. do not trust third-party security tools just because they market themselves as security tools
5. update the system and review logs regularly

## 5. Practical first-session checklist

If you want a short first pass, do this:

```bash
sw_vers
csrutil status
/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
sudo systemsetup -getremotelogin
sudo fdesetup status
launchctl list | grep -i xprotect
systemextensionsctl list
sshd -V 2>&1 || true
```

Then manually review:

* System Settings → Privacy & Security
* System Settings → General → Login Items & Extensions
* System Settings → General → Software Update

## Bottom line

Start small.

A shorter set of controls that you understand and maintain is stronger than a larger set you copied without verifying.