//
//  JsonPaser.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import UIKit

class JsonParser {
    enum FileName: String {
        case fileName = "Mock"
    }
    var product: Product?
    
    func JsonParsingData() {
        guard let dataAsset = NSDataAsset(name: FileName.fileName.rawValue) else { return }
        
        let jsonDecoder = JSONDecoder()
        product = try? jsonDecoder.decode(Product.self, from: dataAsset.data)
    }
}
