import Foundation
import AppKit

var workspace = NSWorkspace.shared()
var applications = workspace.runningApplications
for app in applications {
    //print(app)
}

var front = workspace.frontmostApplication
print(front)

let appElement = AXUIElementCreateApplication(front!.processIdentifier) //.takeRetainedValue()

var result: AnyObject?
let cf = kAXFocusedWindowAttribute as CFString;
AXUIElementCopyAttributeValue(appElement, cf, &result) 

var x = result as! AXUIElement