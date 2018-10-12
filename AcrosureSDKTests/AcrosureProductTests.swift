//
//  AcrosureProductTests.swift
//  AcrosureSDKTests
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import XCTest
@testable import AcrosureSDK

class AcrosureProductTests: XCTestCase {
    var TEST_PRODUCT_ID = "prod_ta"
    
    func testGet() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN, apiURL: TEST_API_URL)
        let expectation = self.expectation(description: "Getting product")
        var result = AcrosureResponse()
        client.product.get(id: TEST_PRODUCT_ID) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
        }
    }
    
    func testList() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN, apiURL: TEST_API_URL)
        let expectation = self.expectation(description: "Listing product")
        var result = AcrosureResponse()
        client.product.list() { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
        }
    }
}
