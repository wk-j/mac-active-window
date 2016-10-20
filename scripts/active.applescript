tell application "System Events"
    set activeApp to name of first application process whose frontmost is true
end tell
activate application activeApp