//
//  URLType.swift
//  OpenMarket
//
//  Created by Schro on 2022/11/02.
//

import Foundation

enum URLType {
    case healthChecker
    
    var description: String {
        switch self {
        case .healthChecker:
            return "healthChecker"
        }
    }
}
