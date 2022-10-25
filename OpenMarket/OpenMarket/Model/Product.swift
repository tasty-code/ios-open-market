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
    var pages: Pages
    
    enum CodingKeys: String, CodingKey {
        case offset, limit, pages
        case pageNo = "page_no"
        case itemsPerPage = "item_per_page"
        case totalCount = "total_count"
    }
}

struct Pages: Decodable {
    let id: Int
    let vendorId: Int
    let name: String
    let thumbnail: String
    let corrency: String
    let price: Int
    let bargainPrice: Int
    let discountedPrice: Int
    let stock: Int
    let createdAt: String
    let issuedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, corrency, price, stock
        case vendorId = "vendor_id"
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}
