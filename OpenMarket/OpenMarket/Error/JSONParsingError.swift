//
//  JSONParsingError.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/11/08.
//

import Foundation

enum JSONParsingError: Error, LocalizedError {
    case jsonDecodingError
    
    var errorDescription: String {
        switch self {
        case .jsonDecodingError:
            return "json 디코딩 오류"
        }
    }
}
