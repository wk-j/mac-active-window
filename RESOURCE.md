## Resources

- http://stackoverflow.com/questions/2296812/how-to-activate-mac-os-x-application-with-a-given-process-id
- http://developer.telerik.com/featured/javascript-os-x-automation-example
- http://stackoverflow.com/questions/10022437/applescript-to-javascript
- https://discussions.apple.com/thread/3796727?start=0&tstart=0

## Change to frontmost

```
tell application "System Events"
    set theprocs to every process whose unix id is myProcessId
    repeat with proc in theprocs
        set the frontmost of proc to true
    end repeat
end tell
```

## Reopen

```
tell application "System Events"
    bundle identifier of process 1 whose id is 1234
end tell
tell application id result
    reopen
    activate
end tell
```

## Change to frontmost

```
tell application "System Events"
	set proc to item 1 of (processes whose unix id is 25068)
	set the frontmost of proc to true
end tell
```

### Edit

```
tell application "System Events"
	set proc to item 1 of (processes whose unix id is 25068)
	set the position of proc window {100, 100}
end tell
```