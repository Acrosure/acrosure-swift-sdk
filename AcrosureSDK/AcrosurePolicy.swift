//
//  AcrosurePolicy.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AcrosurePolicy {
    var api: AcrosureAPI
    
    init(api: AcrosureAPI) {
        self.api = api
    }
    
    func get(id: String, handler: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path:"/policies/get",
            data: [
                "policy_id": id
            ]
        ) { resp in handler(resp) }
    }
    
    func list(query: Parameters? = [:], handler: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path:"/policies/list",
            data: query
        ) { resp in handler(resp) }
    }
}


