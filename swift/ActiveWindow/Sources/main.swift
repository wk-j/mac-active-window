import AppKit
import Foundation
import Quartz

struct Location {
    var x = 0
    var y = 0
    var width = 0
    var height = 0
}

func getLocation(pid: Int) -> Location {
    let workspace = NSWorkspace.shared()
    let activeApps = workspace.runningApplications
    for app in activeApps {
        if app.isActive {
             let options = CGWindowListOption(arrayLiteral: CGWindowListOption.excludeDesktopElements, 
                CGWindowListOption.optionOnScreenOnly)
             let windowList = CGWindowListCopyWindowInfo(options, kCGNullWindowID)
             let dict = windowList as! NSArray
             for win in dict {                    
                 let window = (win as! NSDictionary)
                 let windowPid = window.value(forKey: "kCGWindowOwnerPID") as! Int
                 let bounds = window.value(forKey: "kCGWindowBounds") as! NSDictionary
                 
                 if windowPid == pid {
                    let x = bounds.value(forKey: "X")! as! Int
                    let y = bounds.value(forKey: "Y")! as! Int
                    let width = bounds.value(forKey: "Width")! as! Int
                    let height = bounds.value(forKey: "Height")! as! Int
                    return Location(x:x, y: y, width: width, height: height)
                 }
             }
        }
    }
    return Location()
}

func toJson(location: Location) -> String {
    do {
        let dict = [ 
            "location" : [ "x": location.x, "y": location.y, "width": location.width, "height": location.height ]
        ]
        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
        return json!
    } catch { 
        return "{}"
    } 
}

let pid = Int(CommandLine.arguments[1])!
let location = getLocation(pid: pid)
let json = toJson(location: location)

print(json);
    