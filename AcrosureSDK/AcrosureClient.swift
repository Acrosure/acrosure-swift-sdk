//
//  AcrosureClient.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias GetTokenHandler = () -> String

class AcrosureClient {
    var api: AcrosureAPI
    var application: AcrosureApplication
    var product: AcrosureProduct
    var policy: AcrosurePolicy
    
    init(token: String) {
        self.api = AcrosureAPI(token: token)
        self.application = AcrosureApplication(api: self.api)
        self.product = AcrosureProduct(api: self.api)
        self.policy = AcrosurePolicy(api: self.api)
    }
    
    func setToken(token: String) {
        self.api.setToken(token: token)
    }
    
    func getToken() -> String {
        return self.api.token
    }
}

struct AcrosureResponse {
    var status: String?
    var data: JSON
    var message: String?
    var pagination: JSON
    init(status: String? = nil, data: JSON = [], message: String? = nil, pagination: JSON = []) {
        self.status = status
        self.data = data
        self.message = message
        self.pagination = pagination
    }
}

class AcrosureAPI {
    var token: String
    
    init(token: String) {
        self.token = token
    }
    
    func setToken(token: String) {
        self.token = token
    }
    
    func convertToAcrosureResponse(json: JSON) -> AcrosureResponse {
        let acrosureResponse = AcrosureResponse(
            status: json["status"].string,
            data: json["data"],
            message: json["message"].string,
            pagination: json["pagination"]
        )
        return acrosureResponse
    }
    
    func call(
        path: String,
        data: Parameters? = [:],
        handler: @escaping (AcrosureResponse) -> Void
    ) {
        Alamofire.request(
            "https://api.phantompage.com\(path)",
            method: HTTPMethod.post,
            parameters: data,
            encoding: JSONEncoding.default,
            headers: [
                "Authorization": "Bearer \(self.token)"
            ]
        ).responseJSON { response in
            if let json = response.result.value {
                let acrosureResponse = self.convertToAcrosureResponse(json: JSON(json))
                handler(acrosureResponse)
            } else if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                let acrosureResponse = self.convertToAcrosureResponse(json: JSON(utf8Text))
                handler(acrosureResponse)
            }
        }
    }
}
