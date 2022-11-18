//
//  Pages.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import Foundation

struct ListPage: Decodable, Hashable {
    let id: Int
    let vendorId: Int
    let name: String
    let description: String?
    let thumbnail: String
    let currency: String
    let price: Double
    let bargainPrice: Double
    let discountedPrice: Double
    let stock: Int
    let createdAt: String
    let issuedAt: String
    
    
  
    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, currency, price, stock, description
        case vendorId = "vendor_id"
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}
