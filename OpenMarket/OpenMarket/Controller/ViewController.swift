//
//  OpenMarket - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Foundation

class ViewController: UIViewController {
    var productData: [Product] = []
    let netWork = NetWork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getData() {
        netWork.getProductData { (result: Result<Product, Error> ) in
            switch result {
            case .success(let product):
                self.productData.append(product)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
