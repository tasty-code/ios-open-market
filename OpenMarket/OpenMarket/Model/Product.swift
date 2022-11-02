//
//  Item.swift
//  OpenMarket
//
//  Created by Schro on 2022/10/25.
//

import Foundation
struct Product: Decodable {
    var id: Int
    var vendorId: Int
    var name: String
    var thumbnail: String
    var currency: String
    var price: Float
    var bargainPrice: Float
    var discountedPrice: Float
    var stock: Int
    var createdAt: String
    var issuedAt: String
    
    enum CodingKeys: String, CodingKey {
        case vendorId = "vendor_id"
        case bargainPrice = "bargain_price"
        case discountedPrice = "discounted_price"
        case createdAt = "created_at"
        case issuedAt = "issued_at"
        case id, name, thumbnail, currency, price, stock
    }
}
