//
//  OpenMarketDataParsingTest.swift
//  OpenMarketDataParsingTest
//
//  Created by 천승희 on 2022/10/25.
//

import XCTest
@testable import OpenMarket

class OpenMarketDataParsingTest: XCTestCase {
    var pageData: Page?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        pageData = nil
    }
    
    func test_페이지_데이터_파싱_여부_확인() {
        var isNotNil: Bool = false
        pageData = try? JSONParser().getData()
        if pageData != nil {
            isNotNil = true
        }
        XCTAssertTrue(isNotNil)
    }
    
    func test_데이터_파싱후_페이지번호_출력() {
        let pageNo = 1
        pageData = try? JSONParser().getData()
        let result = pageData?.pageNo
        XCTAssertEqual(result, pageNo)
    }
    
    func test_데이터_파싱후_첫번째_아이템_아이디_출력() {
        let id = 20
        pageData = try? JSONParser().getData()
        let result = pageData?.pages[0].id
        XCTAssertEqual(result, id)
    }
}
