//
//  ProductDataViewModel.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 18/04/23.
//

import Foundation

struct ProductDataViewModel: Identifiable {
    var id: String
    
    var title: String
    var imageUrl: String
    var price: Double
    var ratingCount: Double
    var isWhisList: Bool = false
    
    init(with product: Product) {
        self.id = product.id
        self.title = product.title
        self.imageUrl = product.imageURL
        self.price = product.price.first?.value ?? 0.0
        self.ratingCount = product.ratingCount
        self.isWhisList = product.isInWishlist
    }
}
