//
//  JSONParser.swift
//  OpenMarket
//
//  Created by 천승희 on 2022/10/25.
//

import UIKit

struct JSONParser {
    enum FileName: String {
        case productFile
        var description: String {
            switch self {
            case .productFile:
                return "products"
            }
        }
    }
    
    func getData() throws -> Page {
        guard let pageDataAsset = NSDataAsset(name: FileName.productFile.description), let pageData = try? JSONDecoder().decode(Page.self, from: pageDataAsset.data) else {
            throw MyError.parsingError
        }
        return pageData
    }
}
