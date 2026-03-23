# macOS Privacy & Hardening Toolkit

A practical, evidence-first hardening guide for modern macOS systems.

This repository is built for security-conscious macOS users who want better visibility, better verification, and a more deliberate local security posture. It focuses on attack-surface reduction, integrity checks, firewalling, DNS privacy, logging, and forensic visibility.

This is not a one-click hardening script, and it does not assume every control fits every threat model.

Use at your own risk. Test everything before touching a primary machine.

## Scope

This repository covers:

- integrity and signature checks for installer packages and applications
- host identity, users, and group review
- built-in firewall hardening with `socketfilterfw`
- DNS privacy and `/etc/hosts` workflows
- logging, auditing, and forensic visibility
- XProtect awareness and update-path checks
- password policy and login-window hardening
- FileVault and Lockdown Mode considerations
- browser and VPN recommendations
- third-party tooling references for visibility and control

Each topic is documented under `docs/` with commands, rationale, and tradeoffs.

## Who this repository is for

This repository is primarily useful for:

- privacy-conscious macOS users
- defenders and blue teamers
- DFIR-minded users who want a repeatable local baseline
- higher-risk users who want more visibility into what their Mac is doing

This is not a generic compliance template. It is a practical workstation hardening repository with explicit tradeoffs.

## Start here

Read these files first:

- `QUICKSTART.md`
- `THREAT_MODEL.md`
- `TESTED_ON.md`
- `DISCLAIMER.md`

Then move into the numbered guides under `docs/`.

## Quick start

Clone the repository:

```bash
git clone https://github.com/Jeremy-Burgos/macos-privacy-hardening.git
cd macos-privacy-hardening
````

Open the overview:

```bash
open docs/00-overview.md
```

Good first sections to review:

* `docs/01-integrity-and-xprotect.md`
* `docs/03-firewall-and-networking.md`
* `docs/05-logging-and-auditing.md`
* `docs/10-browsers-and-vpns.md`

The scripts under `scripts/` are examples only. Read them before running them.

## Repository structure

```text
macos-privacy-hardening/
├── README.md
├── QUICKSTART.md
├── DISCLAIMER.md
├── CHANGELOG.md
├── SECURITY.md
├── TESTED_ON.md
├── THREAT_MODEL.md
├── .editorconfig
├── .markdownlint.json
├── .github/
├── docs/
└── scripts/
```

## macOS version awareness

This repository is written for relatively recent macOS versions, especially Ventura, Sonoma, and Sequoia-era systems.

Some controls are version-sensitive. Always confirm your version before assuming behavior:

```bash
sw_vers
```

Compatibility notes should be documented explicitly when a workflow changes between releases.

## Philosophy

This repository is built around five assumptions:

1. defaults are not always sufficient
2. signed or built-in software should not be blindly trusted
3. visibility matters as much as blocking
4. verification matters more than checklist hardening
5. every control should have a reason, a verification path, and a rollback mindset

## About

MIT-licensed macOS workstation hardening guide focused on visibility, verification, integrity checks, firewalling, DNS privacy, logging, and forensic visibility for modern macOS systems.
