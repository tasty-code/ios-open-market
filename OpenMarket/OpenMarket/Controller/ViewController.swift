//
//  OpenMarket - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Foundation

class ViewController: UIViewController {
    let network = NetWork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.getDetailPageData { data in
            print(data.id)
        }
        network.getProductData { data in
            print(data.pageNo)
        }
        
    }
}
