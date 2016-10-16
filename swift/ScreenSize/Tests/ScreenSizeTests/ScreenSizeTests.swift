import XCTest
@testable import ScreenSize

class ScreenSizeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ScreenSize().text, "Hello, World!")
    }


    static var allTests : [(String, (ScreenSizeTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
