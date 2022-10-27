//
//  JSONParsingTests.swift
//  JSONParsingTests
//
//  Created by 박도원 on 2022/10/26.
//

import XCTest
@testable import OpenMarket

final class JSONParsingTests: XCTestCase {
    let jsonParser = JsonParser()

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_파싱_되는지_확인() {
        let product = jsonParser.jsonParsingData()
        
        print(product)
    }
    
    func test_파싱한데이터_pageNo와_1이랑_비교() {
        let product = jsonParser.jsonParsingData()
        
        let pageNo = product?.pageNo
        
        XCTAssertEqual(1, pageNo)
    }

}
