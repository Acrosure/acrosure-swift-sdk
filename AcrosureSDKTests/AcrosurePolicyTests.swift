//
//  AcrosurePolicyTests.swift
//  AcrosureSDKTests
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import XCTest
@testable import AcrosureSDK

class AcrosurePolicyTests: XCTestCase {
    var TEST_POLICY_ID = "plcy_sample"
    
    func testGet() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting policy")
        var result = AcrosureResponse()
        client.policy.get(id: TEST_POLICY_ID) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            print(result)
            XCTAssertEqual(result.status, "ok")
        }
    }
    
    func testList() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Listing policies")
        var result = AcrosureResponse()
        client.policy.list() { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
        }
    }
}
