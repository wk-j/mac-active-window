set theApp to (path to frontmost application as Unicode text)
tell application theApp
    get properties of (window 1)
end tell