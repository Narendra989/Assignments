//
//  ProductListView.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productViewModel: ProductListViewModel
    @State var isLoading: Bool = true
    
    var body: some View {
        NavigationView {
            if productViewModel.products.count > 0 {
                List(productViewModel.products) { product in
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        ProductListRow(product: product)
                    }
                }
                .navigationTitle(AppConstant.productsTabTitle)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                    .scaleEffect(3)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
