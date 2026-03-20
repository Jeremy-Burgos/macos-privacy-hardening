# Privacy Permissions and TCC

macOS privacy permissions are not just user-interface prompts. They are part of a major security boundary.

TCC stands for Transparency, Consent, and Control. It governs access to sensitive capabilities and user data such as:

- Full Disk Access
- Accessibility
- Automation
- Files and Folders
- Screen Recording
- Input Monitoring
- Camera
- Microphone

Many security tools, investigation workflows, and administrative tasks fail silently or produce incomplete results when these permissions are missing.

## 1. Why this matters

A hardening or forensic workflow can look broken when the real issue is missing permission.

Common examples:

- a tool cannot inspect all user data because it lacks Full Disk Access
- automation scripts fail because Automation permission was never granted
- input or UI interaction tools do nothing because Accessibility permission is missing
- file access appears inconsistent because Files and Folders permission has not been granted

Before assuming the operating system is malfunctioning, check privacy permissions first.

## 2. Where to review privacy permissions

On modern macOS, review settings here:

- System Settings
- Privacy & Security

Relevant sections include:

- Full Disk Access
- Accessibility
- Automation
- Files and Folders
- Screen Recording
- Input Monitoring
- Developer Tools
- Camera
- Microphone

If a security or troubleshooting tool needs broad access, this is one of the first places to check.

## 3. Full Disk Access

Full Disk Access is one of the most important privacy permissions for administrative and security tooling.

Without it, a tool may be blocked from seeing or reading large parts of the system and user data.

Typical examples that may require it:

- endpoint security tools
- forensic collection tools
- terminal-based administrative workflows
- backup or indexing tools
- anti-malware tools
- log and artifact inspection tools

Grant this carefully. Full Disk Access is powerful, and giving it to the wrong tool defeats the point of hardening.

## 4. Accessibility and Automation

Accessibility permission is commonly needed by software that:

- controls the interface
- simulates input
- inspects UI state
- interacts across app boundaries

Automation permission is commonly needed when one app or script attempts to control another app.

These permissions are often requested by legitimate software, but they are also dangerous if granted casually.

Treat them as sensitive control-plane permissions, not harmless convenience prompts.

## 5. Files and Folders

macOS can require user consent before apps access:

- Desktop
- Documents
- Downloads
- removable volumes
- network volumes

This is useful both for privacy and for troubleshooting.

If a tool seems to “miss” files in known locations, check whether it has the appropriate access before assuming the files are gone or the tool is defective.

## 6. Resetting TCC prompts

If you need to reset privacy permissions and force macOS to prompt again, use `tccutil`.

Reset all permissions for all apps:

```bash
tccutil reset All
````

Reset a specific service for a specific app bundle identifier:

```bash
tccutil reset Accessibility com.example.app
```

You can substitute other services where supported, for example:

* `Accessibility`
* `ScreenCapture`
* `Microphone`
* `Camera`

Use this carefully. Resetting broadly can create noise and repeated prompts across the system.

## 7. Practical review workflow

When a security or administrative tool behaves unexpectedly:

1. Check whether it requires Full Disk Access.
2. Check whether it requires Accessibility or Automation.
3. Check whether it requires Files and Folders access.
4. Reset the relevant TCC permission if the state looks inconsistent.
5. Re-test the workflow.

This avoids wasting time on false assumptions.

## 8. What not to do

Do not:

* grant Full Disk Access to every utility you install
* grant Accessibility to unknown software without questioning why it needs it
* assume prompts are meaningless
* ignore repeated permission requests from tools that should not need them

Permissions should be minimized just like network exposure or admin access.

## 9. Verification checklist

Review the following manually in System Settings:

* Full Disk Access
* Accessibility
* Automation
* Files and Folders
* Screen Recording
* Input Monitoring

If troubleshooting a specific app, reset and re-test:

```bash
tccutil reset All com.example.app
```

or a narrower reset:

```bash
tccutil reset Accessibility com.example.app
```

## 10. Bottom line

TCC is one of the quietest but most important security boundaries in macOS.

A well-hardened Mac is not one where every prompt has been approved. It is one where sensitive permissions are understood, reviewed, minimized, and granted deliberately.
