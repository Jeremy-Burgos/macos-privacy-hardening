# Threat Model

This repository is not built around a single universal security profile.

Hardening only makes sense when it is tied to:

- what you are defending
- who or what you are defending against
- how much usability you are willing to trade for control and visibility

This document defines the threat-model assumptions behind the repo and helps readers decide which sections to prioritize.

## What this repository is optimized for

This repository is primarily optimized for:

- privacy-conscious individual macOS users
- researchers and technical users who want more local visibility
- defenders who want a repeatable workstation hardening baseline
- users in higher-risk environments who want to reduce attack surface and tighten verification

It is not optimized for:

- enterprise fleet management at scale
- casual users who want zero-touch security
- users who are unwilling to verify changes after applying them
- environments where convenience matters more than security controls

## Threat categories considered

This repository assumes some or all of the following may matter:

### 1. Commodity threats

Examples:

- adware
- known malware
- malicious installers
- fake browser extensions
- low-effort phishing payloads

Relevant sections:

- integrity and signature checks
- XProtect checks
- browser and VPN guidance
- firewall and DNS controls

### 2. Opportunistic network threats

Examples:

- untrusted public networks
- weak local network hygiene
- passive monitoring by third parties
- unwanted inbound exposure

Relevant sections:

- Application Firewall hardening
- stealth mode
- remote login disablement
- DNS privacy
- `/etc/hosts` controls
- network inspection commands

### 3. Persistence and local post-compromise abuse

Examples:

- unwanted LaunchAgents or LaunchDaemons
- suspicious login items
- plist abuse
- stealthy local changes that survive reboots

Relevant sections:

- launchctl inspection
- plist inspection with `plutil -p`
- hidden file and directory review
- logging and auditing
- third-party persistence tooling such as KnockKnock and BlockBlock

### 4. Higher-risk targeted activity

Examples:

- exploit-driven compromise attempts
- credential theft
- stealthy local persistence
- aggressive monitoring attempts
- abuse of signed binaries or trusted system paths

Relevant sections:

- Lockdown Mode
- strict firewall posture
- FileVault
- XProtect verification
- reduced auto-trust behavior
- forensic visibility commands
- browser segregation and VPN discipline

This repository does not claim to fully defeat highly resourced attackers. It is meant to reduce attack surface, improve visibility, and make unauthorized changes easier to detect.

## Suggested profiles

## Profile 1: Safe baseline

Best for:

- general privacy-conscious users
- developers
- most personal workstations

Prioritize:

- FileVault
- firewall enabled
- stealth mode enabled
- auto-allow for signed apps reviewed and tightened
- remote login disabled unless needed
- XProtect current
- show filename extensions
- browser and VPN selection
- basic logging familiarity

Tradeoff:

- low to moderate friction

## Profile 2: Defensive workstation

Best for:

- researchers
- blue teamers
- people handling sensitive data
- users who want stronger local visibility

Prioritize everything in Safe baseline, plus:

- launch agent and daemon inspection
- regular package and code signature verification
- DNS privacy setup
- login window hardening
- install log retention review
- optional third-party outbound firewall tooling
- optional App inspection and persistence tooling

Tradeoff:

- moderate friction
- more prompts
- more ongoing maintenance

## Profile 3: High-risk hardening

Best for:

- users who believe they may be specifically targeted
- users handling highly sensitive investigations or data
- users willing to accept usability loss

Prioritize everything in Defensive workstation, plus:

- Lockdown Mode evaluation
- strict browser separation
- Tor Browser or Mullvad Browser for specific workflows
- always-on VPN discipline
- reduced trust in convenience features
- aggressive review of startup, logging, and network behavior
- minimal software footprint

Tradeoff:

- high friction
- compatibility issues are likely
- more breakage and more operational discipline required

## What this repository does not try to do

This repository does not try to be:

- a compliance framework
- a CIS benchmark implementation guide for managed fleets
- a one-click hardening script
- a substitute for backups, patching, account hygiene, or secure browsing behavior
- a guarantee that compromise will be prevented

## Core philosophy

The main assumptions behind this repository are:

1. Defaults are not always sufficient.
2. Signed or built-in software should not be blindly trusted.
3. Visibility matters as much as blocking.
4. Verification matters more than checkbox hardening.
5. Every control should be evaluated against the user’s actual risk and tolerance for friction.

If a control cannot be explained, verified, and rolled back, it should not be applied casually.