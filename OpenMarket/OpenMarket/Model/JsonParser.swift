//
//  JsonPaser.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import UIKit

class JsonParser {
    enum FileName: String {
        case fileName = "products"
    }
    
    func mockParsingData() -> ListPage? {
        guard let dataAsset = NSDataAsset(name: FileName.fileName.rawValue) else {
            return nil
        }
        let jsonDecoder = JSONDecoder()
        let product = try? jsonDecoder.decode(ListPage.self, from: dataAsset.data)
        
        return product
    }
}
