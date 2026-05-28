# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A single-keyword Alfred workflow. Triggering `hideall` runs an AppleScript that hides every visible, foreground app except the focused app and Finder, then minimizes Finder's open windows to the Dock. Finder is intentionally kept *visible* (not hidden) so that the standard "hide current window" shortcuts still have something to fall back to.

Why? Because I often hide the current window afterwards and if Finder is hidden, you can't!

## Rebuild after edits

The `.alfredworkflow` bundle is just a zip of `info.plist`. After editing the script:

```sh
zip -j "Hide All But Focused.alfredworkflow" info.plist
```

Then double-click the bundle to reinstall in Alfred (it offers to replace the existing version).

## Source-of-truth caveat

The AppleScript is **inlined** inside `info.plist` under the script action's `script` key — that's what Alfred actually executes. `hide.applescript` is a standalone mirror kept only so the script is browsable on GitHub without parsing XML. If you edit one, update the other.

## Alfred script-type gotcha

In `info.plist`, the script action's `type` integer means:
- `6` = osascript AppleScript ← what this workflow uses
- `7` = osascript JavaScript (JXA)

Setting it to `7` will silently route the AppleScript through the JS interpreter and fail with a `SyntaxError` on the first non-JS-looking token. If the workflow stops working after an edit, check that `type` is still `6`.

## No focus-race delay needed

By the time Alfred invokes the script action, it has already dismissed its window and yielded focus back to the previous app, so `name of (first process whose frontmost is true)` reliably returns the user's actual focused app — not Alfred. Confirmed empirically. Don't add a `delay` at the top defensively.

## Permissions

The script calls `set visible of process to false` and `set value of attribute "AXMinimized"`, both of which require **Accessibility** permission for Alfred (System Settings → Privacy & Security → Accessibility). First run prompts; if behavior goes silent after an OS update, toggle the permission off/on.
