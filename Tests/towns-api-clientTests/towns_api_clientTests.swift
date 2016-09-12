import XCTest
@testable import TownsApiClient

class towns_api_clientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        TownsService(serviceBaseUrl: "http://localhost:8080")
            .getAll(successful: { (towns: Towns) in
                XCTAssertGreaterThan(towns.towns.count, 2)
            }, failure: {
                (Error) -> () in
                    XCTAssertFalse(true)
            })
    }


    static var allTests : [(String, (towns_api_clientTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
