//
//  NetWorkError.swift
//  OpenMarket
//
//  Created by 이은호 on 2022/11/03.
//

import Foundation

enum NetWorkError: Error, LocalizedError {
    case urlError, unknownError, statusError, decodingError
    
    var errorDescription: String {
        switch self {
        case .urlError:
            return "URL을 불러오지 못했습니다."
        case .unknownError:
            return "알 수 없는 에러입니다."
        case .statusError:
            return "status코드가 200에서 299사이가 아닙니다."
        case .decodingError:
            return "디코딩이 수행되지 않았습니다."
        }
    }
}
