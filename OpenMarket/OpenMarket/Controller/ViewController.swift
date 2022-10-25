//
//  OpenMarket - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pageDataAsset = NSDataAsset(name: "products") else {
            print(1)
            return
        }
        
        guard let pageData = try? JSONDecoder().decode(Page.self, from: pageDataAsset.data) else {
            print(2)
            return
        }
        
        print(pageData.totalCount)
    }
}

