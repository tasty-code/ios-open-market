//
//  NetWorkError.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/11/03.
//

import Foundation

enum NetWorkError: Error, LocalizedError {
    case urlError, unknownError, statusError, networkDecodingError
    
    var errorDescription: String {
        switch self {
        case .urlError:
            return "url 오류"
        case .unknownError:
            return "unknown"
        case .statusError:
            return "status코드 오류"
        case .networkDecodingError:
            return "네트워크 디코딩 오류"
        }
    }
}
