# alfred-hide-apps-but-not-finder

A single-keyword Alfred workflow. Triggering `hideall` runs an AppleScript that hides every visible, foreground app except the focused app and Finder, then minimizes Finder's open windows to the Dock. Finder is intentionally kept *visible* (not hidden) so that the standard "hide current window" shortcuts still have something to fall back to.

Why? Because I often hide the current window afterwards and if Finder is hidden, you can't!

## Install

Double-click `Hide All But Focused.alfredworkflow` — Alfred will import it.

Grant Alfred Accessibility permission if prompted: **System Settings → Privacy & Security → Accessibility**.

## Files

- `info.plist` — Alfred workflow definition. The AppleScript is inlined here; this is what Alfred actually runs.
- `hide.applescript` — readable copy of the same script for browsing on GitHub. Keep in sync with `info.plist` if you edit either.
- `Hide All But Focused.alfredworkflow` — installable bundle (just `info.plist`, zipped).

## Rebuild the bundle after edits

```sh
zip -j "Hide All But Focused.alfredworkflow" info.plist
```
