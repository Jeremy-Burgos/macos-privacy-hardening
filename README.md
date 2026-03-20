# macOS Privacy & Hardening Toolkit
macOS Privacy & Hardening Toolkit is a practical, evidence-first hardening guide for security-conscious macOS users. It focuses on visibility, verification, and attack-surface reduction. It is not a one-click hardening script and does not assume every control fits every threat model.

# macOS Privacy & Hardening Toolkit
This repository focuses on attack-surface reduction, integrity checks, firewalling, DNS privacy, logging, and forensic visibility. It is not a one-click hardening script, and it does not assume every control fits every threat model.

Use at your own risk. Test in a VM or non-production environment before touching a primary machine.

## Scope

This toolkit covers:

- Integrity and signature checks (packages, app code)
- Hostnames, users, and groups
- Built-in firewall (Application Firewall / socketfilterfw)
- DNS privacy (dnscrypt-proxy, dnsmasq with DNSSEC) and `/etc/hosts`
- Logging, auditing, and install log retention
- XProtect status and secure configuration (based on Wazuh / CIS logic)
- Password policies and lockout configuration
- Loginwindow banners and UI hardening
- FileVault and basic “lockdown mode” concepts
- References to third-party tools (Vallum, Little Snitch, LuLu, Murus, etc.)

Each topic is documented under `docs/` with commands and their rationale.

## Target audience

- Security-conscious macOS users
- Defenders in high-risk environments
- DFIR folks who want a repeatable baseline to compare against

This is **not** a vendor-neutral “compliance” template. It is a practical baseline with clear trade-offs.

## Quick start

1. Clone the repo:

   ```bash
   git clone https://github.com/TheGreenArrow22/macos-privacy-hardening.git
   cd macos-privacy-hardening

2. Start with the overview:

   ```bash
   open docs/00-overview.md

3. Apply sections selectively:

   * Integrity and XProtect: `docs/01-integrity-and-xprotect.md`
   * Firewall and networking: `docs/03-firewall-and-networking.md`
   * Password policies: `docs/06-password-policy.md`

4. Use the scripts under `scripts/` as **examples only**. They are deliberately conservative and heavily commented.

## macOS version notes

Commands and recommendations here assume a relatively recent macOS (Ventura, Sonoma, Sequoia). Some legacy commands and daemons may be deprecated. Always check:

```bash
sw_vers
```

before assuming behavior.

## Disclaimer

You are responsible for verifying these configurations in your own environment. Some changes can:

* Lock you out of an account
* Break network connectivity
* Interfere with third-party security tools

Read before you paste. Use version control for system config where possible.
