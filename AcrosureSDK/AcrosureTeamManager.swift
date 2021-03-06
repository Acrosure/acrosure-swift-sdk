//
//  AcrosureTeamManager.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 11/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class AcrosureTeamManager {
    var api: AcrosureAPI
    
    public init(api: AcrosureAPI) {
        self.api = api
    }
    
    public func getInfo(callback: @escaping (AcrosureResponse) -> Void) {
        return api.call(
            path: "/teams/get-info"
        ) { resp in callback(resp) }
    }
}

