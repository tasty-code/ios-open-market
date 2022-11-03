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
    
    func mockParsingData() -> Product? {
        guard let dataAsset = NSDataAsset(name: FileName.fileName.rawValue) else {
            return nil
        }
        let jsonDecoder = JSONDecoder()
        let product = try? jsonDecoder.decode(Product.self, from: dataAsset.data)
        
        return product
    }
}

protocol Parser {
    func openMarketParser<T: Decodable>(model: T, data: Data ) -> T
}

extension JsonParser: Parser {
    func openMarketParser<T: Decodable>(model: T, data: Data) -> T {
        let openMarketDecoder = JSONDecoder()
        guard let openMarketData = try? openMarketDecoder.decode(T.self, from: data) else { return model }
        return openMarketData
    }
}
