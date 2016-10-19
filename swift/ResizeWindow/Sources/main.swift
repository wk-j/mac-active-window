import Foundation

let script = [
    "set theApp to (path to frontmost application as Unicode text)\n",
    "tell application \"System Events\"\n",
    "   set activeApp to name of the first process whose frontmost is true\n",
    "end tell\n",
    "tell application theApp\n",
    "   activate\n",
    "   set the bounds of window 1 to {300, 300, 300, 300}\n",
    "end tell"
].reduce("", +)

//script = [ "set theApp to (path to frontmost application as Unicode text)"].reduce("", +)

let appleScript = NSAppleScript(source: script)

var possibleError: NSDictionary?
appleScript?.executeAndReturnError(&possibleError)

if let error = possibleError {
    print("ERROR: \(error)")
}