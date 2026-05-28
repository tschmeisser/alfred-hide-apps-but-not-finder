# alfred-hide-apps-but-not-finder

A small Alfred workflow with two keywords:

- `hideall` — hides every visible, foreground app except the focused app and Finder, then minimizes Finder's open windows to the Dock. Finder is intentionally kept *visible* (not hidden) so the standard "hide current window" shortcuts still have something to fall back to.
- `showfinder` — restores any minimized Finder windows and brings Finder forward.

Why? Because I often hide the current window afterwards and if Finder is hidden, you can't!

## Install

Double-click `Hide All But Focused.alfredworkflow` — Alfred will import it.

Grant Alfred Accessibility permission if prompted: **System Settings → Privacy & Security → Accessibility**.

## Files

- `info.plist` — Alfred workflow definition. Both AppleScripts are inlined here; this is what Alfred actually runs.
- `hide.applescript` / `showfinder.applescript` — readable copies of the scripts for browsing on GitHub. Keep in sync with `info.plist` if you edit either.
- `Hide All But Focused.alfredworkflow` — installable bundle (just `info.plist`, zipped).

## Rebuild the bundle after edits

```sh
zip -j "Hide All But Focused.alfredworkflow" info.plist
```
