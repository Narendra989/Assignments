//
//  ProductDetailsView.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject var productViewModel: ProductListViewModel
    let product: ProductDataViewModel
    private let imageSize: CGFloat = 200
    @State private var image: UIImage! = UIImage(named: "no_Image")
    
    var body: some View {
        let price = "\(product.price)"
        VStack(alignment: .center) {
            
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: product.imageUrl)) { phase in // 1
                    if let image = phase.image { // 2
                        // if the image is valid
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else {
                        //appears as placeholder image
                        Image("no_Image") // 4
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }.frame(width: 200, height: 200, alignment: .center)
                    .padding()
            } else {
                // Fallback on earlier versions
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize, height: imageSize, alignment: .center)
            }
            
            
            HStack() {
                VStack(alignment: .leading) {
                    Text(product.title)
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                    Text("$ \(price)")
                        .font(.system(size: 14))
                    RatingView(rating: .constant(product.ratingCount), maxRating: Int(AppConstant.maxRating))
                }
                Spacer()
                let imageName = product.isWhisList ? AppConstant.whislistProductImage : AppConstant.nonWhislistProductImage
                Image(systemName: imageName).resizable().onTapGesture {
                    if let index = productViewModel.products.firstIndex(where: { $0.id == product.id }) {
                        productViewModel.products[index].isWhisList = !productViewModel.products[index].isWhisList
                    }
                    
                }.frame(width: 30, height: 30)
                
                
            }
            .padding()
            
            Spacer()
        }.navigationTitle(product.title)
            .onAppear {
                Task {
                    image = await productViewModel.loadImage(imagePath: product.imageUrl)
                }
            }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProductDetailsView(productViewModel: ProductListViewModel(service: FetchProductDataService()), product: ProductDataViewModel(with: nil))
    }
}
