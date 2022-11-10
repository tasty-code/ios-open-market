//
//  OpenMarket - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Foundation

class ViewController: UIViewController {
    let jsonParser = JSONParser()
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = try? jsonParser.getMockData()
        print(a?.pageNo)
    }
}
