//
//  OpenMarket - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    func jsonParsingData() -> Product? {
        guard let dataAsset = NSDataAsset(name: "products") else {
            return nil
        }
        let jsonDecoder = JSONDecoder()
        let product = try? jsonDecoder.decode(Product.self, from: dataAsset.data)
        
        return product
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let product = jsonParsingData()
        print(product?.pageNo)
    }
}
