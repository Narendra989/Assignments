//
//  AppConstant.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import Foundation

struct AppConstant {
    static let productsTabTitle = "Products"
    static let favouritesTabTitle = "Favourites"
    static let noImage = "no_Image"
    static let baseURL = "https://run.mocky.io/v3"
    static let maxRating = 5.0
    static let whislistProductImage = "heart.fill"
    static let nonWhislistProductImage = "heart"
    static let cartBtnImage = "cart.fill.badge.plus"
    static let productTabImage = "bag.circle.fill"
    static let favouriteTabImage = "star.square.on.square.fill"
}

class AppMessage {
    static let shared = AppMessage()
    private init() {}
    var errorMessage = ""
}
