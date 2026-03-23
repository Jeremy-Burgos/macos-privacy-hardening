# Changelog

All notable changes to this repository should be documented in this file.

This changelog is meant to track meaningful documentation and structure changes, not every tiny wording fix.

## [0.1.0] - 2026-03-20

### Added

- initial public macOS privacy and hardening repository structure
- `README.md`
- `QUICKSTART.md`
- `DISCLAIMER.md`
- `CHANGELOG.md`
- `SECURITY.md`
- `TESTED_ON.md`
- `THREAT_MODEL.md`
- `.editorconfig`
- `.markdownlint.json`
- `.github/workflows/markdownlint.yml`

### Added under `docs/`

- `00-overview.md`
- `01-integrity-and-xprotect.md`
- `02-users-and-groups.md`
- `03-firewall-and-networking.md`
- `04-dns-and-hosts.md`
- `05-logging-and-auditing.md`
- `06-password-policy.md`
- `07-loginwindow-and-banners.md`
- `08-finder-ui-and-filevault.md`
- `09-third-party-tools.md`
- `10-browsers-and-vpns.md`
- `compatibility-and-version-notes.md`
- `gatekeeper-and-notarization.md`
- `privacy-permissions-and-tcc.md`
- `login-items-background-items-and-extensions.md`
- `update-hygiene-and-background-security.md`

### Added under `scripts/`

- example firewall hardening script
- example DNS privacy script
- example password-policy script
- example audit enablement script

### Changed

- repository positioned as a practical, evidence-first macOS hardening project
- root documentation expanded to include threat-model and testing context
- version-awareness and compatibility notes added for modern macOS behavior
- browser and VPN guidance added
- Gatekeeper, TCC, login items, background items, and update hygiene coverage added

### Notes

- repository scope is local workstation hardening for modern macOS systems
- scripts are examples, not blind automation
- users should verify all changes before trusting them on production or primary machines

## [Unreleased]

### Planned

- root-level formatting and documentation normalization
- first tagged GitHub release
- stronger file-by-file verification and rollback patterns across major docs
- additional screenshots or diagrams where they improve clarity