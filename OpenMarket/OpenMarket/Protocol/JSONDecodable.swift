//
//  JsonPaser.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import UIKit

protocol JSONDecodable {

}

extension JSONDecodable {
    func mockParsingData<T: Decodable>(name: String, data: T) -> T? {
        print("여기")
        guard let dataAsset = NSDataAsset(name: name) else {
            print("nilnilnil")
            return nil
        }
        print("여기1")
        let jsonDecoder = JSONDecoder()
        guard let data = try? jsonDecoder.decode(T.self, from: dataAsset.data) else {
            print("ninlninljlnio")
            return nil
        }
        print("여기2")
        return data
    }
}
