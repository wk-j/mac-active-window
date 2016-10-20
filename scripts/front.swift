import Foundation
import AppKit

var workspace = NSWorkspace.shared()
var applications = workspace.runningApplications
for app in applications {
    //print(app)
}

var front = workspace.frontmostApplication
print(front)

let appElement = AXUIElementCreateApplication(front!.processIdentifier)

var result: AnyObject?
let cf = kAXFocusedWindowAttribute as CFString
AXUIElementCopyAttributeValue(appElement, cf, &result) 

var x = result as! AXUIElement
print(x)

/*
let mo = Mirror(reflecting: result!)

for (index, attr) in mo.children.enumerated() {
    if let property_name = attr.label as String! {
        print("Attr \(index): \(property_name) = \(attr.value)")
    }
}
*/