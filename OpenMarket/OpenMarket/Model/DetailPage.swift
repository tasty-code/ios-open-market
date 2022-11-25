//
//  DetailPage.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/11/02.
//

import Foundation

enum Currency: String, Decodable {
    case krw = "KRW"
    case usd = "USD"
}

struct DetailPage: Decodable, Hashable {
    let id: Int
    let vendorId: Int
    let name: String
    let description: String
    let thumbnail: String
    let currency: Currency
    let price: Float
    let bargainPrice: Float
    let discountedPrice: Float
    let stock: Int
    let createdAt: String
    let issuedAt: String
    let images: [Images]?
    let vendors: Vendors?
    
    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, currency, price, stock, description, images, vendors
        case vendorId = "vendor_id"
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case createdAt = "created_at"
        case issuedAt = "issued_at"
    }
}
