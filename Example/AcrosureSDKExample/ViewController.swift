//
//  ViewController.swift
//  AcrosureSDKExample
//
//  Created by Aikdanai Sidhikosol on 12/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import UIKit
import AcrosureSDK

class ViewController: UIViewController {
    var acrosureClient: AcrosureClient
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.acrosureClient = AcrosureClient(
            token: TEST_PUBLIC_TOKEN,
            apiURL: TEST_API_URL
        )
    }

    @IBAction func initiateTest(_ sender: Any) {
        
    }
}

