//
//  RequestHandlerTests.swift
//  NihilentAssignmentTests
//
//  Created by Narendra Satpute on 18/04/23.
//


import XCTest
@testable import NihilentAssignment

class RequestHandlerTests: XCTestCase {

    var requestHandler = RequestHandler()
    
    func testcreateURLRequest() {
        let request = requestHandler.createURLRequest(requestType: .fetchProductList)
        XCTAssertNotNil(request)
        let httpMethod = request.httpMethod
        let url = request.url
        XCTAssertEqual(httpMethod, "GET")
        XCTAssertEqual(url, URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328"))
    }
}
