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
            case .success(let success):
                print(success.id)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}
