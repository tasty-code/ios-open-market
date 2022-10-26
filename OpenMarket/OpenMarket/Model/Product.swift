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
}
