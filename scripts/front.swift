import AppKit
import Foundation

func go() {
    let frontmostApplication = NSWorkspace.shared().frontmostApplication!
    let appElement = AXUIElementCreateApplication(frontmostApplication.processIdentifier)
    
    var result: AnyObject?
    AXUIElementCopyAttributeValue(appElement, kAXFocusedWindowAttribute as CFString, &result)
    
    let windowElement = result as! AXUIElement
    let point = CGPoint(x: 100 , y: 200) as AnyObject
        
    AXUIElementSetAttributeValue(windowElement, kAXPositionAttribute as CFString , point);
}

go()