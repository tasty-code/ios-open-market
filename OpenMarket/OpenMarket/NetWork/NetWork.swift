//
//  File.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/10/31.
//

import Foundation
import UIKit

class NetWork: OpenMarketAPI {
    func getProductData(completion: @escaping (Result<Product, Error>) -> Void) {
        let url = OpenMarketURL.host + OpenMarketURL.listPath + OpenMarketURL.queryParameter
        self.getOpenMarketData(url: url, completion: completion)
    }
    
    func getDetailPageData(completion: @escaping (Result<DetailPage, Error>) -> Void) {
        let url = OpenMarketURL.host + OpenMarketURL.detailPath 
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
                    completion(.failure(NetWorkError.networkDecodingError))
                }
            }
        }
        task.resume()
    }
}
