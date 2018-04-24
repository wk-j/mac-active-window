import AppKit
import Foundation

func getSize() -> Dictionary<String, CGFloat> {
    let screen = NSScreen.main()!
    let rect = screen.frame
    let height = rect.size.height
    let width = rect.size.width
    let dict = ["height": height, "width": width ]
    return dict
}

func toJson(size: Dictionary<String, CGFloat>) -> String {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: size , options: .prettyPrinted)
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
        return json!
    } catch {
        return "{}"
    }
}

var size = getSize()
var json = toJson(size: size)
print(json)