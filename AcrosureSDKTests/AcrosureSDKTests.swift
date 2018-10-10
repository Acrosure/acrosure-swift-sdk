//
//  AcrosureSDKTests.swift
//  AcrosureSDKTests
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import AcrosureSDK

class AcrosureSDKTests: XCTestCase {
    func testClientInitialization() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        XCTAssertNotNil(client)
        XCTAssertNotNil(client.api)
        XCTAssertEqual(client.api.token, TEST_PUBLIC_TOKEN)
    }
}
