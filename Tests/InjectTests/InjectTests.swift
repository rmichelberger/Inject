import XCTest
@testable import Inject

final class InjectTests: XCTestCase {
    func testDependencies() throws {
        let test = "test"
        @Provides var testDependency = { test }
        @Inject var testInjection: String
        XCTAssertEqual(test, testInjection)
    }
}
