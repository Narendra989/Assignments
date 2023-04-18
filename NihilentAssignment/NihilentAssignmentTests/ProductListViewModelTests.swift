//
//  ProductListViewModelTests.swift
//  NihilentAssignmentTests
//
//  Created by Narendra Satpute on 18/04/23.
//

import XCTest
@testable import NihilentAssignment

class ProductListViewModelTests: XCTestCase {
    
    
    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
       
    }
    
    func testInitMethod() {
        let sut = ProductListViewModel(service: MockFetchProductDataService())
       
        sut.fetchProducts()
        
        XCTAssertEqual(sut.products.count, 0)
        XCTAssertNotNil(sut)
        
        
    }

}


class MockProductListViewModel: ProductListViewModel {
    let mockService: FetchProductDataServiceProtocol
    override init(service: FetchProductDataServiceProtocol) {
        self.mockService = service
        super.init(service: service)
    }
    
    override func fetchProducts()  {
        Task {
            self.products = await (mockService.fetchProductData()?.products.map { ProductDataViewModel(with: $0) })!
        }
    }
}
