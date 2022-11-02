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
        network.getOpenMarketData(url: "https://openmarket.yagom-academy.kr/api/products/32") { data in
            print(data.id)
        
        }
    }
}
