//
//  OpenMarket - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var productData: Product?
    
    func productParsing() {
        guard let dataAsset = NSDataAsset(name: "products") else { return }
        print(dataAsset)
        let jsonDecoder = JSONDecoder()
        productData = try? jsonDecoder.decode(Product.self, from: dataAsset.data)
        print(productData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productParsing()
        print(productData?.pageNo)
    }
}
