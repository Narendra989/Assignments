//
//  FavouritesView.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var productViewModel: ProductListViewModel
    var body: some View {
        NavigationView {
          
            List(productViewModel.products.filter { $0.isWhisList }) { product in
                NavigationLink(destination: ProductDetailsView(productViewModel: productViewModel, product: product)) {
                    ProductListRow(productViewModel: productViewModel, product: product)
                }
            }
            .navigationTitle(AppConstant.favouritesTabTitle)
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(productViewModel: ProductListViewModel(service: FetchProductDataService()))
    }
}
