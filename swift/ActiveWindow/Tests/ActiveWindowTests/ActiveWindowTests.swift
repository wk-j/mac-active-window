import XCTest
@testable import ActiveWindow

class ActiveWindowTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ActiveWindow().text, "Hello, World!")
    }


    static var allTests : [(String, (ActiveWindowTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
