//
//  Error.swift
//  OpenMarket
//
//  Created by 천승희 on 2022/10/25.
//

import Foundation

enum MyError: Error, LocalizedError {
    case unvalidURL
    case parsingError
    
    var errorDescription: String {
        switch self {
        case .unvalidURL:
            return "url 생성 실패"
        case .parsingError:
            return "dataParsing 실패"
        }
    }
}
