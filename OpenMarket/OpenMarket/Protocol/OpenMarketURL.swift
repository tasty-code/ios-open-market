//
//  URL.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/11/04.
//

import Foundation

let random = Int.random(in: 1...32)
enum OpenMarketURL {
    static let host = "https://openmarket.yagom-academy.kr/"
    static let listPath = "api/products"
    static let detailPath = "api/products/\(random)"
    static let queryParameter = "?page_no=1&items_per_page=100"
}
