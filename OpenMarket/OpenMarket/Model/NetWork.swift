//
//  File.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/10/31.
//

import Foundation

struct NetWork {
    
    func getOpenMarketData(url: String, completion: @escaping (DetailPage) -> () ) {
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
                    let receivedData = try JSONDecoder().decode(DetailPage.self, from: data)
                    completion(receivedData)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
