//
//  FetchDataServiceTests.swift
//  NihilentAssignmentTests
//
//  Created by Narendra Satpute on 18/04/23.
//

import XCTest
@testable import NihilentAssignment

class FetchDataServiceTests: XCTestCase {
    
    let sut = MockFetchProductDataService()

    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
       
    }
    
    func testfetchProductData() async throws {
        let response = await sut.fetchProductData()
        XCTAssertNotNil(response)
        XCTAssertTrue((response?.products?.count)! > 0)
        
        let product = response?.products?.first
        
        XCTAssertNotNil(product)
        XCTAssertEqual(product?.title, "Diamond Label Shiraz")
        XCTAssertEqual(product?.id, "23124")
        
        XCTAssertEqual(product?.ratingCount, 4.0)
    }
}


class MockFetchProductDataService: FetchProductDataServiceProtocol {
    func loadImage(from imagePath: String) async -> UIImage? {
        return UIImage(named: "no_Image")
    }
    
    func fetchProductData() async -> NihilentAssignment.ProductResponse? {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "mock", ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        do {
            let jsonData = jsonString.data(using: .utf8)!
            let productResponse = try JSONDecoder().decode(ProductResponse.self, from: jsonData)
            return productResponse
        } catch {
            return nil
        }
        
    }
}
