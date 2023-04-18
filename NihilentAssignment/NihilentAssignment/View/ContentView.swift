//
//  ContentView.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var productViewModel = ProductListViewModel(service: FetchProductDataService())
    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Label(AppConstant.productsTabTitle, systemImage: AppConstant.productTabImage)
                }
            FavouritesView()
                .tabItem {
                    Label(AppConstant.favouritesTabTitle, systemImage: AppConstant.favouriteTabImage)
                }
        }
        .onAppear {
            productViewModel.fetchProducts()
        }
        .environmentObject(productViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

