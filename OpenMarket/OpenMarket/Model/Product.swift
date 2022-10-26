//
//  Product.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/10/25.
//

import Foundation

struct Product: Decodable {
    let pageNo: Int
    let itemsPerPage: Int
    let totalCount: Int
    let offset: Int
    let limit: Int
    let pages: Pages
    let lastPage: Int
    let hasNext: Bool
    let hasPrev: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case offset, limit, pages
        case pageNo = "page_no"
        case itemsPerPage = "item_per_page"
        case totalCount = "total_count"
        case lastPage = "last_page"
        case hasNext = "has_next"
        case hasPrev = "has_prev"
    }
}
