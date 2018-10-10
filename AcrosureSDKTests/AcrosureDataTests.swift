//
//  AcrosureDataTests.swift
//  AcrosureSDKTests
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import XCTest
@testable import AcrosureSDK

class AcrosureDataTests: XCTestCase {
    func testGetWithoutDependencies() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting data with dependencies")
        var result = AcrosureResponse()
        client.data.get(handler: "province") { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            print(result)
            XCTAssertEqual(result.status, "ok")
        }
    }
    
    func testGetWithDependencies() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting data with dependencies")
        var result = AcrosureResponse()
        client.data.get(handler: "subdistrict", dependencies:["กรุงเทพมหานคร","วังทองหลาง"]) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
        }
    }
}
