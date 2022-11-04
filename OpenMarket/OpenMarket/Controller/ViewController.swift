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
        network.getDetailPageData { (result: Result<DetailPage, Error>) in
            switch result {
                case .success(let data):
                    print(data.id)
                case .failure(let failure):
                    print(failure)
                }
            }
        
        network.getProductData { (result: Result<Product, Error>) in
            switch result {
                case .success(let data):
                    print(data.pageNo)
                case .failure(let failure):
                    print(failure)
            }
        }
        
    }
}
