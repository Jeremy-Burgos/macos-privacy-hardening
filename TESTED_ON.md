# Tested On

This repository contains a mix of:

- commands directly validated in modern macOS environments
- workflows reviewed against current Apple platform behavior
- compatibility notes that may vary by release

This file exists to separate:

- what has been personally validated
- what is documented but version-sensitive
- what readers should test before relying on it

## Validation model used in this repository

Statuses used here:

- **Validated**: directly tested in a real environment
- **Reviewed**: syntax and behavior reviewed against current platform documentation or known command behavior, but not fully field-tested in every scenario
- **Version-sensitive**: may behave differently across Ventura, Sonoma, Sequoia, and Tahoe
- **Use with caution**: high-friction or high-risk controls that should be tested on a non-primary system first

## Current project validation baseline

At this stage, the repository should be treated as:

- **Reviewed** for modern macOS versions
- **Version-sensitive** where Apple changed behavior between releases
- **Use with caution** for controls that affect login, networking, DNS, firewall behavior, or audit logging

## macOS versions covered by this repository

### Ventura

Status: Reviewed

Notes:

- Older verification methods may still work here where newer releases have moved away from them.
- Readers should still prefer the repository’s newer command-line workflows where possible.

### Sonoma

Status: Reviewed

Notes:

- The deprecated audit subsystem is not enabled by default.
- Some older audit workflows require explicit opt-in and should not be treated as baseline behavior.

### Sequoia

Status: Reviewed

Notes:

- Firewall behavior and logging guidance changed.
- Compatibility checks that rely on old property-list assumptions should be treated carefully.
- Some security tooling behavior is more explicitly tied to current Apple command-line utilities and update flows.

## Hardware notes

### Apple silicon

Status: Recommended primary target

Notes:

- This repository is written with modern macOS behavior in mind.
- Apple silicon should be treated as the primary reference platform unless otherwise noted.

### Intel Macs

Status: Supported with caution

Notes:

- Many commands still apply.
- Some platform behavior, security posture, performance, and compatibility assumptions may differ.
- Readers should verify each change instead of assuming parity with Apple silicon systems.

## Sections that require extra validation before use

The following areas should always be tested before being applied to a primary machine:

- firewall behavior
- DNS privacy changes
- `/etc/hosts` overrides
- FileVault changes
- login window changes
- password policy changes
- audit subsystem changes
- third-party firewall or packet-filter combinations

## Recommended personal workflow for maintainers

Before marking a section as fully validated, confirm:

1. The command still exists.
2. The command still works as documented.
3. The state change can be verified.
4. A rollback path exists.
5. The behavior is not release-specific without a compatibility note.

## Suggested maintenance rule

When a control is changed, add a note with:

- date reviewed
- macOS version reviewed
- whether behavior was validated or only documentation-reviewed

Example format:

- 2026-03-13 — Sequoia — Reviewed
- 2026-03-13 — Sonoma — Reviewed
- 2026-03-13 — Ventura — Pending direct validation

## Honest status

This repository should not claim universal validation across all Macs and all OS versions unless every section has been re-tested directly.

It is stronger, more professional, and more credible to be explicit about what is:

- validated
- reviewed
- version-sensitive
- pending direct confirmation