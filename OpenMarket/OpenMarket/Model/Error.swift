//
//  Error.swift
//  OpenMarket
//
//  Created by 천승희 on 2022/10/25.
//

import Foundation

enum MyError: Error, LocalizedError {
    case parsingError
    var errorDescription: String {
        switch self {
        case .parsingError:
            return "dataParsing 실패"
        }
    }
}
