//
//  ProductDataViewModelTests.swift
//  NihilentAssignmentTests
//
//  Created by Narendra Satpute on 18/04/23.
//

import XCTest
@testable import NihilentAssignment

class ProductDataViewModelTests: XCTest {

    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
       
    }
    
    
    func testConvertedModel() async throws {
        
        let mockService = MockFetchProductDataService()
        let response = await mockService.fetchProductData()
        let product = response?.products?.first
        
        XCTAssertNotNil(mockService)
        XCTAssertNotNil(response)
        XCTAssertNotNil(product)
        
        let viewModel = ProductDataViewModel(with: product!)
        
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.id, product?.id)
        XCTAssertEqual(viewModel.title, product?.title)
        XCTAssertEqual(viewModel.ratingCount, product?.ratingCount)
        XCTAssertEqual(viewModel.isWhisList, product?.isInWishlist)
        XCTAssertEqual(viewModel.imageUrl, product?.imageURL)
     
    }
}
