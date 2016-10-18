import XCTest
@testable import ResizeWindow

class ResizeWindowTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ResizeWindow().text, "Hello, World!")
    }


    static var allTests : [(String, (ResizeWindowTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
