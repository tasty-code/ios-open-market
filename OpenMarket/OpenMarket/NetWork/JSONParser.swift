//
//  JSONParser.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/11/09.
//

import Foundation

struct JSONParser: JSONDecodable {
    var product: Product?

    func getProductData() throws -> Product? {
        let fileName = "products"
        guard let mock = try? mockParsingData2(name: fileName, data: product) else {throw NetWorkError.unknownError}
        return mock
    }
}
