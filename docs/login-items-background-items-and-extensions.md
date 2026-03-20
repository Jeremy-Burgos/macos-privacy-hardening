# Login Items, Background Items, and Extensions

Modern macOS persistence and system modification do not live only in classic LaunchAgents and LaunchDaemons.

Users and defenders also need to pay attention to:

- login items
- background items
- system extensions
- plug-ins and helper components

This document focuses on practical visibility and review.

## 1. Why this matters

A Mac can be altered in ways that are not obvious from the Dock or Applications folder.

Background components may:

- start automatically at login
- continue running after installation
- monitor system behavior
- extend networking, filtering, or device access
- create noise, instability, or persistence

That does not make them malicious by default. It does make them worth reviewing.

## 2. Review Login Items and Extensions in System Settings

On modern macOS, review these here:

- System Settings
- General
- Login Items & Extensions

This is the first place to look for:

- applications configured to open at login
- background items registered by software
- extension-related settings exposed through the UI

If you install a new tool and suddenly see new background items, review them immediately instead of assuming they are harmless.

## 3. Login items

Login items are applications, documents, folders, or server connections configured to open automatically when a user logs in.

This is not always malicious. Many legitimate tools do this.

Still, you should know:

- what launches automatically
- why it launches
- whether you still need it

If an app has no good reason to start with your session, remove it.

## 4. Background items

Background items are often helper components used by installed software.

These may include:

- update helpers
- sync engines
- filtering components
- menu-bar support processes
- utility daemons tied to app functionality

Review every background item with the same mindset you would apply to an unexpected cron job or Windows autorun entry: what is it, why is it there, and do you trust it?

## 5. System extensions

System extensions are modern replacements for some older kernel-extension-style functionality.

They may support things such as:

- network filtering
- endpoint security
- USB or device support
- driver-like behavior in a more constrained model

List system extensions:

```bash
systemextensionsctl list
````

Review the output for:

* team identifiers
* app or vendor names
* categories of extensions present

Unknown extensions from vendors you do not recognize should be investigated.

## 6. Plug-ins and extension inventory

You can also inspect registered plug-ins:

```bash
pluginkit -m
```

This can help identify:

* app extensions
* helper plug-ins
* extension points used by installed software

The output can be noisy. Use it as an inventory and correlation tool, not as a standalone verdict.

## 7. Correlate with classic persistence checks

This file does not replace launchd review.

Still check:

```bash
launchctl list
sudo launchctl list
```

And inspect relevant plists:

```bash
plutil -p /path/to/file.plist
```

The point is to correlate multiple visibility layers:

* what the UI exposes
* what launchd is running
* what extensions are installed
* what the vendor claims the software is doing

## 8. Practical review workflow after installing new software

After installing any security tool, network tool, or system utility:

1. Review Login Items & Extensions in System Settings.

2. Run:

   ```bash
   systemextensionsctl list
   ```

3. Run:

   ```bash
   pluginkit -m
   ```

4. Compare with:

   ```bash
   launchctl list
   ```

5. Inspect any new plists or helper binaries if something looks off.

This turns post-install review into a habit instead of a guess.

## 9. What to look for

The following deserve closer attention:

* items that launch automatically without a clear reason
* helpers from vendors you do not recognize
* multiple overlapping background components from the same product
* extensions that remain after uninstall attempts
* software that keeps re-registering itself after removal
* security tools that install more filtering or monitoring components than expected

Not every surprise is malicious. Some are just sloppy software. That is still worth documenting.

## 10. Bottom line

A professional hardening workflow does not stop at “what apps are installed.”

It also asks:

* what starts automatically
* what runs in the background
* what extends the system
* what remains after the main app is closed

Those answers matter when you are trying to keep a Mac both lean and trustworthy.
