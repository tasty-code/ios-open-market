//
//  JSONParsingTests.swift
//  JSONParsingTests
//
//  Created by 박도원 on 2022/10/26.
//

import XCTest
@testable import OpenMarket

final class JSONParsingTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_파싱한데이터의_pageNo는_1이다() {
        let pageNumber = 1
        
        let product = try? JSONParser().getMockData()
        
        XCTAssertEqual(pageNumber, product?.pageNo)
    }

}
