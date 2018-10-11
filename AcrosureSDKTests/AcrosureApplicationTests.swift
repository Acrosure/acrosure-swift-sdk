//
//  AcrosureApplicationTests.swift
//  AcrosureSDKTests
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import AcrosureSDK

var applicationId = ""
var packageCode = ""

class AcrosureApplicationSubmitTests: XCTestCase {
    var appData = JSON(SUBMIT_APP_DATA)
    func test01_createEmpty() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Creating application")
        var result = AcrosureResponse()
        client.application.create(productId: self.appData["product_id"].string!) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertNotNil(result.data?["id"].string)
            applicationId = (result.data?["id"].string)!
        }
    }
    
    func test02_get() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting application")
        var result = AcrosureResponse()
        client.application.get(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(applicationId, result.data?["id"].string)
        }
    }
    
    func test03_updateBasicData() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Updating application")
        var result = AcrosureResponse()
        client.application.update(id: applicationId, basicData: self.appData["basic_data"]) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(applicationId, result.data?["id"].string)
            XCTAssertEqual(AcrosureApplicationStatus.PACKAGE_REQUIRED.rawValue, result.data?["status"].string)
        }
    }

    func test04_getPackages() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting application packages")
        var result = AcrosureResponse()
        client.application.getPackages(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            let packages = result.data?.array ?? []
            XCTAssertGreaterThan(packages.count, 0)
            XCTAssertNotNil(packages[0]["package_code"].string)
            packageCode = (packages[0]["package_code"].string)!
        }
    }
    
    func test05_selectPackage() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Selecting application package")
        var result = AcrosureResponse()
        client.application.selectPackage(id: applicationId, packageCode: packageCode) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(AcrosureApplicationStatus.DATA_REQUIRED.rawValue, result.data?["status"].string)
        }
    }
    
    func test06_getCurrentPackage() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting current application package")
        var result = AcrosureResponse()
        client.application.getPackage(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(packageCode, result.data?["package_code"].string)
        }
    }

    func test07_updateCompletedData() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Updating application")
        var result = AcrosureResponse()
        client.application.update(
            id: applicationId,
            basicData: self.appData["basic_data"],
            packageOptions: self.appData["package_options"],
            additionalData: self.appData["additional_data"]
        ) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(applicationId, result.data?["id"].string)
            XCTAssertEqual(AcrosureApplicationStatus.READY.rawValue, result.data?["status"].string)
        }
    }
    
    func test08_getHash() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting application hash")
        var result = AcrosureResponse()
        client.application.getHash(
            id: applicationId,
            frontendUrl: "https://example.com"
        ) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertNotNil(result.data?["payment_url"])
        }
    }
    
    func test09_submit() {
        let client = AcrosureClient(token: TEST_SECRET_TOKEN)
        let expectation = self.expectation(description: "Submitting application")
        var result = AcrosureResponse()
        client.application.submit(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(applicationId, result.data?["id"].string)
            XCTAssertEqual(AcrosureApplicationStatus.SUBMITTED.rawValue, result.data?["status"].string)
        }
    }
}


class AcrosureApplicationConfirmTests: XCTestCase {
    var appData = JSON(CONFIRM_APP_DATA)
    func test01_createEmpty() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Creating application")
        var result = AcrosureResponse()
        client.application.create(productId: self.appData["product_id"].string!) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertNotNil(result.data?["id"].string)
            applicationId = (result.data?["id"].string)!
        }
    }
    
    func test02_get() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting application")
        var result = AcrosureResponse()
        client.application.get(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(applicationId, result.data?["id"].string)
        }
    }
    
    func test03_updateBasicData() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Updating application")
        var result = AcrosureResponse()
        client.application.update(id: applicationId, basicData: self.appData["basic_data"]) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(applicationId, result.data?["id"].string)
            XCTAssertEqual(AcrosureApplicationStatus.PACKAGE_REQUIRED.rawValue, result.data?["status"].string)
        }
    }
    
    func test04_getPackages() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting application packages")
        var result = AcrosureResponse()
        client.application.getPackages(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            let packages = result.data?.array ?? []
            XCTAssertGreaterThan(packages.count, 0)
            XCTAssertNotNil(packages[0]["package_code"].string)
            packageCode = (packages[0]["package_code"].string)!
        }
    }
    
    func test05_selectPackage() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Selecting application package")
        var result = AcrosureResponse()
        client.application.selectPackage(id: applicationId, packageCode: packageCode) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(AcrosureApplicationStatus.DATA_REQUIRED.rawValue, result.data?["status"].string)
        }
    }
    
    func test06_getCurrentPackage() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Getting current application package")
        var result = AcrosureResponse()
        client.application.getPackage(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(packageCode, result.data?["package_code"].string)
        }
    }
    
    func test07_updateCompletedData() {
        let client = AcrosureClient(token: TEST_PUBLIC_TOKEN)
        let expectation = self.expectation(description: "Updating application")
        var result = AcrosureResponse()
        client.application.update(
            id: applicationId,
            basicData: self.appData["basic_data"],
            packageOptions: self.appData["package_options"],
            additionalData: self.appData["additional_data"]
        ) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(result.status, "ok")
            XCTAssertEqual(applicationId, result.data?["id"].string)
            XCTAssertEqual(AcrosureApplicationStatus.READY.rawValue, result.data?["status"].string)
        }
    }
    
    func test08_confirm() {
        let client = AcrosureClient(token: TEST_SECRET_TOKEN)
        let expectation = self.expectation(description: "Confirming application")
        var result = AcrosureResponse()
        client.application.confirm(id: applicationId) { resp in
            result = resp
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15) { (error) in
            if let error = error { XCTFail("timeout errored: \(error)") }
            XCTAssertEqual(applicationId, result.data?["id"].string)
            XCTAssertEqual(AcrosureApplicationStatus.CONFIRMING.rawValue, result.data?["status"].string)
        }
    }
}
