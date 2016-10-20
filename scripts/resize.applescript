set theApp to (path to frontmost application as Unicode text)
tell application theApp
    repeat with w in every window
        log (get properties of w)
   end repeat
end tell