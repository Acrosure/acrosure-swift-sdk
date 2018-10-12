//
//  AcrosureDataManager.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class AcrosureDataManager {
    var api: AcrosureAPI
    
    init(api: AcrosureAPI) {
        self.api = api
    }
    
    func get(handler: String, dependencies: JSON? = [], callback: @escaping (AcrosureResponse) -> Void) {
        var data = JSON()
        data["handler"].string  = handler
        data["dependencies"]    = JSON(dependencies?.array ?? [])
        return api.call(
            path: "/data/get",
            data: data
        ) { resp in callback(resp) }
    }
}
