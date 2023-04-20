//
//  ProductListViewModel.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import Foundation
import SwiftUI



class ProductListViewModel: ObservableObject {
    @Published var products = [ProductDataViewModel]()
    private let service: FetchProductDataServiceProtocol
    
    init(service: FetchProductDataServiceProtocol) {
        self.service = service
    }
    
    func fetchProducts() {
        Task {
            let response = await service.fetchProductData()
            DispatchQueue.main.async {
                if let productList = response?.products {
                    self.products = productList.compactMap { ProductDataViewModel(with: $0) }
                } 
            }
        }
    }
    
    func loadImage(imagePath: String) async -> UIImage {
        return await service.loadImage(from: imagePath) ?? UIImage(named: "no_Image") ?? UIImage()
    }
}
