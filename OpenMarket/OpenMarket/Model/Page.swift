//
//  Page.swift
//  OpenMarket
//
//  Created by Schro on 2022/10/25.
//

import Foundation
struct Page: Decodable {
    var pageNo: Int
    var itemsPerPage: Int
    var totalCount: Int
    var offset: Int
    var limit: Int
    var pages: [Product]
    var lastPage: Int
    var hasNext: Bool
    var hasPrev: Bool
    
    enum CodingKeys: String, CodingKey {
        case pageNo, itemsPerPage, totalCount, offset, limit, pages, lastPage, hasNext, hasPrev
    }
}
