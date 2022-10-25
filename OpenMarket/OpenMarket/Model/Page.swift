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
    var pages: [Item]
    var lastPage: Int
    var hasNext: Bool
    var hasPrev: Bool
    
    enum CodingKeys: String, CodingKey {
        case pageNo = "page_no"
        case itemsPerPage = "items_per_page"
        case totalCount = "total_count"
        case lastPage = "last_page"
        case hasNext = "has_next"
        case hasPrev = "has_prev"
        case offset, limit, pages
    }
}
