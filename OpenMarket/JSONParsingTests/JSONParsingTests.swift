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
        var product = jsonParser.product
        
        jsonParser.jsonParsingData()
        let pageNumber = product?.pageNo
        
        print(pageNumber)
        
//        XCTAssertEqual(1, pageNumber)
    }

}
