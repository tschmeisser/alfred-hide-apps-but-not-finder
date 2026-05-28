tell application "System Events"
	tell process "Finder"
		repeat with w in windows
			try
				set value of attribute "AXMinimized" of w to false
			end try
		end repeat
	end tell
end tell
tell application "Finder" to activate
