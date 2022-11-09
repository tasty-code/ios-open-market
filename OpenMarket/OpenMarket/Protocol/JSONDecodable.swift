//
//  JsonPaser.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import UIKit

protocol JSONDecodable { }

extension JSONDecodable {
    func mockParsingData<T: Decodable>(name: String, data: T) throws -> T? {
        guard let dataAsset = NSDataAsset(name: name) else {
            throw JSONParsingError.jsonDecodingError
        }
        let jsonDecoder = JSONDecoder()
        guard let data = try? jsonDecoder.decode(T.self, from: dataAsset.data) else {
            throw JSONParsingError.jsonDecodingError
        }
        return data
    }
}
