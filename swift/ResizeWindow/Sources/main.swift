import Foundation

let script =
    "tell application \"System Events\"\n" +
        "set proc to item 1 of (processes whose unix id is 25068)\n" +
        "tell proc\n" +
            "set position to {100, 100}\n" +
        "end tell\n" +
    "end tell"

let appleScript = NSAppleScript(source: script)

var possibleError: NSDictionary?
appleScript?.executeAndReturnError(&possibleError)

if let error = possibleError {
    print("ERROR: \(error)")
}