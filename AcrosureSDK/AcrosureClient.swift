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
    
    init(token: String) {
        self.api = AcrosureAPI(token: token)
        self.application = AcrosureApplication(api: self.api)
        self.product = AcrosureProduct(api: self.api)
    }
    
    func getToken() -> String {
        return self.api.token
    }
}


class AcrosureAPI {
    var token: String
    
    init(token: String) {
        self.token = token
    }
    
    func call(
        path: String,
        data: Parameters? = [:],
        handler: @escaping (JSON) -> Void
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
                handler(JSON(json))
            } else if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                handler(JSON(utf8Text))
            }
        }
    }
}
