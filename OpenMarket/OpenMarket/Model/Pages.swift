//
//  Pages.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import Foundation

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
    let description: String
    let images: Images
    let vendors: Vendors
   
    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, corrency, price, stock, description, images, vendors
        case vendorId = "vendor_id"
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}
