//
//  ViewController.swift
//  AcrosureSDKExample
//
//  Created by Aikdanai Sidhikosol on 12/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import UIKit
import AcrosureSDK
import SwiftyJSON

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func initiateTest(_ sender: Any) {
    let client = AcrosureClient(
      token: TEST_PUBLIC_TOKEN,
      apiURL: TEST_API_URL
    )
    var applicationId: String = ""
    
    client.application.create(
      productId: APP_DATA["product_id"].string ?? "",
      basicData: APP_DATA["basic_data"]
    ) { resp1 in
      applicationId = resp1.data?["id"].string ?? ""
      
      client.application.getPackages(id: applicationId) { resp2 in
        let packages = resp2.data?.array ?? []
        let packageCode = (packages[0]["package_code"].string)!
        
        client.application.selectPackage(id: applicationId, packageCode: packageCode) { resp3 in
          
          client.application.update(
            id: applicationId,
            basicData: APP_DATA["basic_data"],
            packageOptions: APP_DATA["package_options"],
            additionalData: APP_DATA["additional_data"]
          ) { resp4 in
            print(resp4.data?["status"].string as Any)
          }
        }
      }
    }
  }
}

