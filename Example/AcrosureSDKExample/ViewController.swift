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
  @IBOutlet weak var initiateButton: UIButton?
  @IBOutlet weak var label1: UILabel?
  @IBOutlet weak var label2: UILabel?
  @IBOutlet weak var label3: UILabel?
  @IBOutlet weak var loadingSpinner: UIActivityIndicatorView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func updateStatus(resp: AcrosureResponse) {
    let status: String = resp.data?["status"].string ?? "An error occurred"
    self.label1?.text = status
  }
  
  @IBAction func initiateTest(_ sender: Any) {
    let client = AcrosureClient(
      token: TEST_PUBLIC_TOKEN,
      apiURL: TEST_API_URL
    )
    var applicationId: String = ""
    self.initiateButton?.isHidden = true
    self.loadingSpinner?.isHidden = false
    self.label2?.text = ""
    self.label3?.text = ""
    
    client.application.create(
      productId: APP_DATA["product_id"].string ?? "",
      basicData: APP_DATA["basic_data"]
    ) { resp1 in
      applicationId = resp1.data?["id"].string ?? ""
      self.label2?.text = applicationId
      self.label3?.text = resp1.data?["application_no"].string ?? ""
      self.updateStatus(resp: resp1)
      
      client.application.getPackages(id: applicationId) { resp2 in
        let packages = resp2.data?.array ?? []
        let packageCode = (packages[0]["package_code"].string)!
        
        client.application.selectPackage(id: applicationId, packageCode: packageCode) { resp3 in
          self.updateStatus(resp: resp3)
          
          client.application.update(
            id: applicationId,
            basicData: APP_DATA["basic_data"],
            packageOptions: APP_DATA["package_options"],
            additionalData: APP_DATA["additional_data"]
          ) { resp4 in
            self.updateStatus(resp: resp4)
            self.initiateButton?.isHidden = false
            self.loadingSpinner?.isHidden = true
          }
        }
      }
    }
  }
}

