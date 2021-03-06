//
//  AcrosureProductManager.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

public class AcrosureProductManager {
    var api: AcrosureAPI
    
    public init(api: AcrosureAPI) {
        self.api = api
    }
    
    public func get(id: String, callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path:"/products/get",
            data: [
                "product_id": id
            ]
        ) { resp in callback(resp) }
    }
    
    public func list(callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path:"/products/list"
        ) { resp in callback(resp) }
    }
}

