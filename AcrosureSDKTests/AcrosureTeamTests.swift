//
//  AcrosureTeamTests.swift
//  AcrosureSDKTests
//
//  Created by Aikdanai Sidhikosol on 11/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import XCTest
@testable import AcrosureSDK

class AcrosureTeamTests: XCTestCase {
    func testGetInfo() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN, apiURL: TEST_API_URL)
        let expectation = self.expectation(description: "Getting team info")
        var result = AcrosureResponse()
        client.team.getInfo { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
        }
    }
}
