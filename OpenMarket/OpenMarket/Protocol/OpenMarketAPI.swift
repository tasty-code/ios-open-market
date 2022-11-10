//
//  API.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/11/04.
//

import Foundation

protocol OpenMarketAPI {
    func getProductData(completion: @escaping (Result<Product, Error>) -> Void)
    func getDetailPageData(completion: @escaping (Result<DetailPage, Error>) -> Void)
}
