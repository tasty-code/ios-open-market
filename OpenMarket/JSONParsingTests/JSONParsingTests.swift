//
//  JSONParsingTests.swift
//  JSONParsingTests
//
//  Created by 박도원 on 2022/10/26.
//

import XCTest
@testable import OpenMarket

final class JSONParsingTests: XCTestCase {
    var product: Product?
    var jsonParser: JSONDecodable?

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_파싱한데이터의_pageNo는_1이다() {
        let fileName = "products"
        let pageNumber = 1
    
        let data = jsonParser?.mockParsingData(name: fileName, data: product)
        
        print(product?.pageNo)
    
    }

}
