//
//  File.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/10/31.
//

import Foundation

protocol API {
    func getDetailPageData(completion: @escaping (DetailPage) -> Void)
    func getProductData(completion: @escaping (Product) -> Void)
}

class NetWork: API {
    func getProductData(completion: @escaping (Product) -> Void) {
        let url = "https://openmarket.yagom-academy.kr/api/products?page_no=1&items_per_page=100"
        self.getOpenMarketData(url: url, completion: completion)
    }
    
    func getDetailPageData(completion: @escaping (DetailPage) -> Void) {
        let url = "https://openmarket.yagom-academy.kr/api/products/32"
        self.getOpenMarketData(url: url, completion: completion)
    }
}

extension NetWork {
    func getOpenMarketData<T: Decodable>(url: String, completion: @escaping (T) -> () ) {
        guard let url = URL(string: url) else {
            return
        }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("error")
                return
            }
            
            if let data = data {
                do {
                    let receivedData = try JSONDecoder().decode(T.self, from: data)
                    completion(receivedData)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
