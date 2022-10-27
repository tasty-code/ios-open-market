//
//  Pages.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import Foundation

struct Page: Decodable {
    let id: Int
    let vendorId: Int
    let vendorName: String?
    let name: String
    let description: String?
    let thumbnail: String
    let currency: String
    let price: Int
    let bargainPrice: Int
    let discountedPrice: Int
    let stock: Int
    let createdAt: String
    let issuedAt: String
    let images: [Images]?
    let vendors: [Vendors]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, currency, price, stock, images, vendors, vendorName, description
        case vendorId = "vendor_id"
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}
