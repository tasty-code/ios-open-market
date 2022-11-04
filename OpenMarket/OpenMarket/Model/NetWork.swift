//
//  File.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/10/31.
//

import Foundation
import UIKit

protocol API {
    func getDetailPageData(completion: @escaping (Result<DetailPage, Error>) -> Void)
    func getProductData(completion: @escaping (Result<Product, Error>) -> Void)
}

class NetWork: API {
    func getProductData(completion: @escaping (Result<Product, Error>) -> Void) {
        let url = "https://openmarket.yagom-academy.kr/api/products?page_no=1&items_per_page=100"
        self.getOpenMarketData(url: url, completion: completion)
    }
    
    func getDetailPageData(completion: @escaping (Result<DetailPage, Error>) -> Void) {
        let url = "https://openmarket.yagom-academy.kr/api/products/32"
        self.getOpenMarketData(url: url, completion: completion)
        
    }
}

extension NetWork {
    func getOpenMarketData<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void ) {
        guard let url = URL(string: url) else {
            completion(.failure(NetWorkError.urlError))
            return
        }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetWorkError.unknownError))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetWorkError.statusError))
                return
            }
            
            if let data = data {
                do {
                    let receivedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(receivedData))
                } catch {
                    completion(.failure(NetWorkError.decodingError))
                }
            }
        }
        task.resume()
    }
}
