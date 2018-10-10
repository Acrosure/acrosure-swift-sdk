//
//  AcrosureApplication.swift
//  AcrosureSDK
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AcrosureApplication {
    var api: AcrosureAPI

    init(api: AcrosureAPI) {
        self.api = api
    }
}
