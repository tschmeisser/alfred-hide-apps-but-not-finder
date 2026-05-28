tell application "System Events"
	set frontApp to name of (first process whose frontmost is true)
	set targets to (every process whose visible is true and background only is false and name is not frontApp and name is not "Finder" and name is not "Alfred")
	repeat with proc in targets
		set visible of proc to false
	end repeat
	tell process "Finder"
		repeat with w in windows
			try
				set value of attribute "AXMinimized" of w to true
			end try
		end repeat
	end tell
end tell
