//
//  OpenMarket - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = try? JSONParser().getData() else {
            return
        }
        
        print(data.pages[0].vendorId)
    }
}

