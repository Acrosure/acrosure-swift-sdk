//
//  AcrosureProduct.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

class AcrosureProduct {
    var api: AcrosureAPI
    
    init(api: AcrosureAPI) {
        self.api = api
    }
    
    func get(id: String, handler: @escaping (JSON) -> Void) {
        return api.call(
            path:"/products/get",
            data: [
                "product_id": id
            ]
        ) { resp in handler(resp) }
    }
    
    func list(handler: @escaping (JSON) -> Void) {
        return api.call(
            path:"/products/list"
        ) { resp in handler(resp) }
    }
}

