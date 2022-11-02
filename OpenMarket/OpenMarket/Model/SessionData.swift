//
//  SessionData.swift
//  OpenMarket
//
//  Created by Schro on 2022/11/01.
//

import UIKit

struct SessionData<T: Decodable> {
    private let host: String = "https://openmarket.yagom-academy.kr/"
    
    private func getURL(from url: URLType) -> URL? {
        URL(string: "\(host)\(url.description)")
    }
    
    func getSessionData(from dataDescription: URLType) throws -> T {
        var resultData: Data?
        let semaphore = DispatchSemaphore(value: 0)
        guard let url = getURL(from: dataDescription) else {
            throw MyError.parsingError
        }
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            resultData = data
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        guard let decodingData = try? JSONParser<T>().decode(data: resultData) else {
            throw MyError.parsingError
        }
        return decodingData
    }
}
