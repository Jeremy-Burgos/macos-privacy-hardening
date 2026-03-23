# Security Policy

This repository contains macOS hardening guidance, example commands, and example scripts.

It is not a managed security product, and it should not be treated as a guarantee of safety.

## Supported scope

This repository is primarily scoped to:

- modern macOS workstation hardening
- Ventura, Sonoma, and Sequoia-era systems
- local visibility, integrity checking, firewalling, DNS/privacy controls, and operational review

The guidance is intended for:

- personal workstations
- research systems
- administrative endpoints
- privacy-conscious users
- defenders and DFIR-minded users

It is not intended as a fleet-management standard, MDM policy pack, or universal compliance framework.

## What to report

Please report issues that could cause users to make unsafe or misleading changes, including:

- incorrect commands
- unsafe example script behavior
- misleading version-specific guidance
- broken verification steps
- documentation that materially misrepresents current macOS behavior
- workflows that could lock users out or weaken the host without adequate warning

## What not to report

Please do not use this repository as a channel for:

- general macOS troubleshooting
- unsupported enterprise-fleet issues
- speculative claims without a concrete repository problem
- requests for private security support

## Reporting guidance

If you identify a serious issue in the documentation or scripts, report it privately first if possible.

Examples of higher-value issues include:

- a command that weakens the host while claiming to harden it
- a rollback path that is incorrect
- a script that changes state more aggressively than documented
- outdated guidance that is dangerous on newer macOS releases

## Operational warning for users

Before applying anything from this repository, users should:

1. read the relevant file in full
2. confirm the host role and macOS version
3. test high-impact changes on a non-primary machine where possible
4. verify the result after the change
5. maintain a rollback path for anything affecting networking, login, or encryption

## No warranty

This repository is provided as documentation and example guidance.

You are responsible for:

- deciding whether a control fits your threat model
- validating commands in your environment
- maintaining system access
- deciding whether a third-party tool deserves trust