//
//  File.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/10/31.
//

import Foundation

struct NetWork {
    enum UrlStruct: String {
        case http = "http://"
        case host = "openmarket.yagom-academy.kr"
        case productsPath = "/api/products"
        case healthPath = "/healthChecker"
        case parameter = "?page_no=1&items_per_page=100"
        case productsPathId = "/api/products/32"
    }
}
