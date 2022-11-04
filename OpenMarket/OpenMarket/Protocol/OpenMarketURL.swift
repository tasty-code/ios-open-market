//
//  URL.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/11/04.
//

import Foundation

protocol OpenMarketURL {
    var host: String { get }
    var listPath: String { get }
    var detailPath: String { get }
    var queryParameter: String { get }
}
