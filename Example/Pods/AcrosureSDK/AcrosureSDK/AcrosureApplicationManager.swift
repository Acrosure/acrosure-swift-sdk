//
//  AcrosureApplicationManager.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AcrosureApplicationManager {
    var api: AcrosureAPI

    init(api: AcrosureAPI) {
        self.api = api
    }
    
    func get(id: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/applications/get",
            data: [
                "application_id": id
            ]
        ) { resp in callback(resp) }
    }
    
    func list(query: AcrosureApplicationQuery?, callback: @escaping (AcrosureResponse) -> Void) {
        var data = JSON()
        data["offset"].int          = query?.offset
        data["limit"].int           = query?.limit
        data["order_by"].string     = query?.orderBy
        data["desc"].bool           = query?.desc
        data["status"].string       = query?.status
        data["source"].string       = query?.source
        data["product_id"].string   = query?.productId
        data["team_id"].string      = query?.teamId
        data["query"].string        = query?.query
        data["partial_match"].bool  = query?.partialMatch
        return api.call(
            path: "/applications/list",
            data: data
        ) { resp in callback(resp) }
    }
    
    func create(
        productId: String,
        basicData: JSON? = nil,
        packageOptions: JSON? = nil,
        additionalData: JSON? = nil,
        attachments: [AcrosureFile]? = nil,
        packageCode: String? = nil,
        ref1: String? = nil,
        ref2: String? = nil,
        ref3: String? = nil,
        groupPolicyId: String? = nil,
        step: Int? = nil,
        callback: @escaping (AcrosureResponse) -> Void
    ) {
        var data = JSON()
        data["product_id"].string   = productId
        data["basic_data"]          = JSON(basicData ?? JSON.null)
        data["package_options"]     = JSON(packageOptions ?? JSON.null)
        data["additional_data"]     = JSON(additionalData ?? JSON.null)
        data["attachments"]         = attachments?.reduce(JSON()) { (previousJSON: JSON, file: AcrosureFile) in
            var arr = previousJSON.array
            arr?.append(JSON([
                "title": file.title,
                "url": file.url,
                "signed_url": file.signedUrl
            ]))
            return JSON(arr ?? [])
            } ?? JSON.null
        data["package_code"].string     = packageCode
        data["ref1"].string             = ref1
        data["ref2"].string             = ref2
        data["ref3"].string             = ref3
        data["group_policy_id"].string  = groupPolicyId
        data["step"].int                = step
        return api.call(
            path: "/applications/create",
            data: data
        ) { resp in callback(resp) }
    }

    func update(
        id: String,
        basicData: JSON? = nil,
        packageOptions: JSON? = nil,
        additionalData: JSON? = nil,
        attachments: [AcrosureFile]? = nil,
        packageCode: String? = nil,
        ref1: String? = nil,
        ref2: String? = nil,
        ref3: String? = nil,
        groupPolicyId: String? = nil,
        step: Int? = nil,
        callback: @escaping (AcrosureResponse) -> Void
        ) {
        var data = JSON()
        data["application_id"] = JSON(id)
        if basicData?.exists() ?? false {
            data["basic_data"] = JSON(basicData ?? JSON.null)
        }
        data["package_options"]     = JSON(packageOptions ?? JSON.null)
        data["additional_data"]     = JSON(additionalData ?? JSON.null)
        data["attachments"]         = attachments?.reduce(JSON()) { (previousJSON: JSON, file: AcrosureFile) in
            var arr = previousJSON.array
            arr?.append(JSON([
                "title": file.title,
                "url": file.url,
                "signed_url": file.signedUrl
                ]))
            return JSON(arr ?? [])
            } ?? JSON.null
        data["package_code"].string     = packageCode
        data["ref1"].string             = ref1
        data["ref2"].string             = ref2
        data["ref3"].string             = ref3
        data["group_policy_id"].string  = groupPolicyId
        data["step"].int                = step
        return api.call(
            path: "/applications/update",
            data: data
        ) { resp in callback(resp) }
    }
    
    func getPackages(id: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/applications/get-packages",
            data: [
                "application_id": id
            ]
        ) { resp in callback(resp) }
    }
    
    func getPackage(id: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/applications/get-package",
            data: [
                "application_id": id
            ]
        ) { resp in callback(resp) }
    }
    
    func selectPackage(id: String, packageCode: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/applications/select-package",
            data: [
                "application_id": id,
                "package_code": packageCode
            ]
        ) { resp in callback(resp) }
    }
    
    func submit(id: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/applications/submit",
            data: [
                "application_id": id
            ]
        ) { resp in callback(resp) }
    }
    
    func confirm(id: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/applications/confirm",
            data: [
                "application_id": id
            ]
        ) { resp in callback(resp) }
    }
    
    func getHash(id: String, frontendUrl: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/payments/2c2p/get-hash",
            data: [
                "application_id": id,
                "frontend_url": frontendUrl
            ]
        ) { resp in callback(resp) }
    }
}
