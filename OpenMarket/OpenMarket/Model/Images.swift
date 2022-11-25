//
//  Images.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/10/26.
//

import Foundation

struct Images: Decodable, Hashable {
    let id: Int
    let url: String
    let thumbnailUrl: String
    let issuedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case thumbnailUrl = "thumbnail_url"
        case issuedAt = "issued_at"
    }
}
