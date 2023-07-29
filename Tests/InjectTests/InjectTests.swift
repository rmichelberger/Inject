import XCTest
@testable import Inject

extension Dependencies {
    var test: String { "test" }
}

final class InjectTests: XCTestCase {
    func testDependencies() throws {
        @Inject(\.test) var test
        XCTAssertEqual(test, "test")
    }
}
