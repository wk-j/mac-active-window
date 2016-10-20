## Resources

- http://stackoverflow.com/questions/2296812/how-to-activate-mac-os-x-application-with-a-given-process-id
- http://developer.telerik.com/featured/javascript-os-x-automation-example
- http://stackoverflow.com/questions/10022437/applescript-to-javascript
- https://discussions.apple.com/thread/3796727?start=0&tstart=0
- https://github.com/electron/electron/issues/4418

## Change to frontmost

```javascript
tell application "System Events"
    set theprocs to every process whose unix id is myProcessId
    repeat with proc in theprocs
        set the frontmost of proc to true
    end repeat
end tell
```

## Reopen

```javascript
tell application "System Events"
    bundle identifier of process 1 whose id is 1234
end tell
tell application id result
    reopen
    activate
end tell
```

## Change to frontmost

```javascript
tell application "System Events"
	set proc to item 1 of (processes whose unix id is 25068)
	set the frontmost of proc to true
end tell
```

## Move frontmost

```javascript
tell application "System Events"
	set activeApp to name of the first process whose frontmost is true
end tell

tell application activeApp
	set the bounds of window 1 to {100, 100, 100, 100}
end tell
```

## Set postition

```javascript
set theApp to "Google Chrome"
set appHeight to 500
set appWidth to 500

set screenWidth to 1000
set screenHeight to 1000

tell application theApp
	activate
	reopen
	set yAxis to (screenHeight - appHeight) / 2 as integer
	set xAxis to (screenWidth - appWidth) / 2 as integer
	set the bounds of the first window to {xAxis, yAxis, appWidth + xAxis, appHeight + yAxis}
end tell
```

## Create application by path

```javascript
set theApp to (path to frontmost application as Unicode text)
tell application theApp
	tell window 1
		set the bounds to {100, 100, 100, 100}
	end tell
end tell
```

### Test ...

```javascript
tell application "System Events"
	set activeApp to name of the first process whose frontmost is true
end tell

tell application activeApp
	set the bounds of window 1 to {100, 100, 100, 100}
end tell
```