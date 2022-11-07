//
//  API.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/11/03.
//

import Foundation

protocol API {
    func getDetailPageData(completion: @escaping (Result<DetailPage, Error>) -> Void)
    func getProductData(completion: @escaping (Result<Product, Error>) -> Void)
}
