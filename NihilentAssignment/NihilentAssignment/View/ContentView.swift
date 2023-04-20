//
//  ContentView.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var productViewModel = ProductListViewModel(service: FetchProductDataService())
    var body: some View {
        TabView {
            ProductListView(productViewModel: productViewModel)
                .tabItem {
                    Label(AppConstant.productsTabTitle, systemImage: AppConstant.productTabImage)
                }
            FavouritesView(productViewModel: productViewModel)
                .tabItem {
                    Label(AppConstant.favouritesTabTitle, systemImage: AppConstant.favouriteTabImage)
                }
        }
        .onAppear {
            productViewModel.fetchProducts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

