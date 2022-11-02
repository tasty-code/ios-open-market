//
//  JSONParser.swift
//  OpenMarket
//
//  Created by 천승희 on 2022/10/25.
//

import UIKit

struct JSONParser<T: Decodable> {
    enum DecodeType {
        case string
    }
    func decode(data: Data?) throws -> T {
        guard let data = data, let decodingData = try? JSONDecoder().decode(T.self, from: data) else {
            throw MyError.parsingError
        }
        return decodingData
    }
}
