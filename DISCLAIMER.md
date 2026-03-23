# Disclaimer

This repository contains documentation, commands, and example scripts for hardening and inspecting macOS systems.

It is not a security product, and it is not a guarantee against compromise.

## What this repository is

This repository is:

- a practical hardening guide
- a collection of curated commands and review workflows
- a reference for improving visibility and reducing attack surface
- a workstation-focused project, not a fleet-management product

## What this repository is not

This repository is not:

- legal advice
- incident-response certification
- a complete DFIR framework
- a substitute for backups
- a substitute for patching and account hygiene
- a one-click “secure your Mac” script

## Risk warning

Some controls and commands in this repository can:

- break network connectivity
- disable access you still need
- interfere with third-party tools
- change login behavior
- create compatibility problems
- increase friction in normal workflows

This is especially true for:

- firewall changes
- DNS changes
- FileVault changes
- password-policy changes
- audit and logging changes
- Lockdown Mode decisions
- third-party filtering and endpoint tools

## Test before trust

Before applying changes to a primary machine, you should:

1. read the relevant document fully
2. understand what the command actually does
3. test on a non-production system or secondary machine where possible
4. verify the result after applying it
5. keep a rollback path

## Version awareness

macOS behavior changes across releases.

A command or workflow that made sense on one release may be version-sensitive on another. Always confirm:

```bash
sw_vers
````

before assuming the repository’s guidance maps cleanly to the machine in front of you.

## Third-party tools

Mentions of browsers, VPNs, firewalls, malware tools, or other third-party utilities are not blanket endorsements.

Every third-party product adds:

* trust assumptions
* update dependencies
* additional code
* possible telemetry
* possible compatibility issues

Review every tool on its own merits.

## No warranty

This repository is provided as documentation and example guidance.

You are responsible for:

* deciding whether a control fits your threat model
* testing commands before using them broadly
* verifying the result
* maintaining access to your own system