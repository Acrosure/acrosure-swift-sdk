//
//  AcrosureStructure.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 11/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AcrosureResponse {
    var status: String?
    var data: JSON?
    var message: String?
    var pagination: JSON?

    public init(
        status: String? = nil,
        data: JSON? = [],
        message: String? = nil,
        pagination: JSON? = []
    ) {
        self.status = status
        self.data = data
        self.message = message
        self.pagination = pagination
    }
}

public struct AcrosureFile {
    var title: String
    var url: String
    var signedUrl: String? = ""
}

public struct AcrosureApplicationQuery: Codable {
    var offset: Int?
    var limit: Int?
    var orderBy: String?
    var desc: Bool?
    var status: String?
    var source: String?
    var productId: String?
    var teamId: String?
    var query: String?
    var partialMatch: Bool?

    public init(
        offset: Int? = nil,
        limit: Int? = nil,
        orderBy: String? = nil,
        desc: Bool? = nil,
        status: String? = nil,
        source: String? = nil,
        productId: String? = nil,
        teamId: String? = nil,
        query: String? = nil,
        partialMatch: Bool? = nil
    ) {
        self.offset = offset
        self.limit = limit
        self.orderBy = orderBy
        self.desc = desc
        self.status = status
        self.source = source
        self.productId = productId
        self.teamId = teamId
        self.query = query
        self.partialMatch = partialMatch
    }
}

public enum AcrosureApplicationStatus: String {
    case INITIAL            = "INITIAL"
    case PACKAGE_REQUIRED   = "PACKAGE_REQUIRED"
    case DATA_REQUIRED      = "DATA_REQUIRED"
    case READY              = "READY"
    case SUBMITTED          = "SUBMITTED"
    case CONFIRMING         = "CONFIRMING"
    case AWAIT_POLICY       = "AWAIT_POLICY"
    case CANCELED           = "CANCELED"
    case EXPIRED            = "EXPIRED"
    case COMPLETED          = "COMPLETED"
    case RENEWED            = "RENEWED"
}

public enum AcrosureApplicationSource: String {
    case PARTNER    = "PARTNER"
    case CUSTOMER   = "CUSTOMER"
    case NONE       = ""
}

public enum AcrosureProductCompleteProcess: String {
    case CONFIRM    = "CONFIRM"
    case SUBMIT     = "SUBMIT"
}
//
//struct AcrosurePackageCoverage: Codable {
//    var key: String?
//    var detail: String?
//    var fullDetail: String?
//    var category: String?
//    var valueText: String?
//    var valueNumber: Double?
//    var valueUnit: String?
//    var main: Bool? = true
//}
//
//struct AcrosureCondition: Codable {
//    var condition: String?
//    var value: <Double,String>?
//}
//
//struct AcrosurePremium: Codable {
//    var netPremium: Double?
//    var grossPremium: Double?
//    var vat: Double?
//    var duty: Double?
//}
//
//struct AcrosurePackage: Codable {
//    var packageName: String?
//    var packageCode: String?
//    var packageDescription: String?
//    var coverageItems: [AcrosurePackageCoverage]?
//    var premium: AcrosurePremium?
//}
//
//struct AcrosureApplicationErrorField: Codable {
//    var field: String?
//    var errorMessage: String?
//}
//
//struct AcrosureApplication: Codable {
//    var id: String?
//    var productId: String?
//    var applicationNo: String?
//    var status: AcrosureApplicationStatus?
//    var source: AcrosureApplicationSource?
//    var userId: String?
//    var teamId: String?
//    var netPremium: Double?
//    var grossPremium: Double?
//    var vat: Double?
//    var duty: Double?
//    var package_data: [AcrosurePackage]?
//    var policyIds: [String]?
//    var errorFields: [AcrosureApplicationErrorField]?
//    var errorMessage: String?
//    var expiredAt: Date?
//    var createdAt: Date?
//    var updatedAt: Date?
//    var basicData: JSON?
//    var packageOptions: JSON?
//    var additionalData: JSON?
//    var ref1: String?
//    var ref2: String?
//    var ref3: String?
//    var packageCode: String?
//    var groupPolicyId: String?
//
//}
//
//struct AcrosureProduct: Codable {
//    var id: String?
//    var name: String?
//    var type: String?
//    var insurerProductCode: String?
//    var handlerId: String?
//    var formItems: [Codable]?
//    var sampleFormData: Da?
//    var language: String?
//    var handlerOptions: Codable?
//    var completeProcess: AcrosureProductCompleteProcess?
//    var isFormAvailable: Bool? = false
//    var config: Codable?
//}
