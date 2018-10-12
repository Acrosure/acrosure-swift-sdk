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

public class AcrosureClient {
    var api: AcrosureAPI
    var application: AcrosureApplicationManager
    var product: AcrosureProductManager
    var policy: AcrosurePolicyManager
    var data: AcrosureDataManager
    var team: AcrosureTeamManager
    
    public init(token: String, apiURL: String? = nil) {
        self.api = AcrosureAPI(token: token, apiURL: apiURL ?? "https://api.acrosure.com")
        self.application = AcrosureApplicationManager(api: self.api)
        self.product = AcrosureProductManager(api: self.api)
        self.policy = AcrosurePolicyManager(api: self.api)
        self.data = AcrosureDataManager(api: self.api)
        self.team = AcrosureTeamManager(api: self.api)
    }
    
    public func setToken(token: String) {
        self.api.setToken(token: token)
    }
    
    public func getToken() -> String {
        return self.api.token
    }
}

public class AcrosureAPI {
    var token: String
    var apiURL: String
    
    public init(token: String, apiURL: String) {
        self.token = token
        self.apiURL = apiURL
    }
    
    public func setToken(token: String) {
        self.token = token
    }
    
    func convertToAcrosureResponse(json: JSON) -> AcrosureResponse {
        let acrosureResponse = AcrosureResponse(
            status: json["status"].string ?? "",
            data: json["data"],
            message: json["message"].string,
            pagination: json["pagination"]
        )
        return acrosureResponse
    }
    
    public func call(
        path: String,
        data: JSON? = [],
        callback: @escaping (AcrosureResponse) -> Void
    ) {
        let parameters: Parameters = data?.dictionaryObject ?? [:]
        Alamofire.request(
            "\(self.apiURL)\(path)",
            method: HTTPMethod.post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: [
                "Authorization": "Bearer \(self.token)"
            ]
        ).responseJSON { response in
            if let json = response.result.value {
                let acrosureResponse = self.convertToAcrosureResponse(json: JSON(json))
                callback(acrosureResponse)
            } else if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                let acrosureResponse = self.convertToAcrosureResponse(json: JSON(utf8Text))
                callback(acrosureResponse)
            }
        }
    }
}
