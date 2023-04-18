//
//  ProductListRow.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import SwiftUI

struct ProductListRow: View {
    @EnvironmentObject var productViewModel: ProductListViewModel
    let product: ProductDataViewModel
    let imageSize: CGFloat = 60
    @State private var image: UIImage = UIImage(named: "no_Image")!
    
    
    
    var body: some View {
        let price = "\(product.price )"
        HStack {
            
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
                }.frame(width: imageSize, height: imageSize, alignment: .center)
            } else {
                // Fallback on earlier versions
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize, height: imageSize, alignment: .center)
            }
            
            VStack(alignment: .leading) {
                Text(product.title)
                Text(" $ \(price)")
            }
            Spacer()
            
            VStack {
                Image(systemName: AppConstant.cartBtnImage).resizable().onTapGesture {
                    //Handle event
                }.frame(width: 25, height: 25)
                let imageName = product.isWhisList ? AppConstant.whislistProductImage : AppConstant.nonWhislistProductImage
                Image(systemName: imageName).resizable().onTapGesture {
                    if let index = productViewModel.products.firstIndex(where: { $0.id == product.id }) {
                        productViewModel.products[index].isWhisList = !productViewModel.products[index].isWhisList
                    }
                }.frame(width: 25, height: 25)
            }
            
        } .onAppear {
            Task {
                image = await productViewModel.loadImage(imagePath: product.imageUrl)
            }
            
        }
    }
}


struct ProductListRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductListRow(product: ProductDataViewModel(with: Product(citrusID: nil, title: "", id: "", imageURL: "", price: [Price(message: nil, value: 0, isOfferPrice: false)], brand: nil, badges: nil, ratingCount: 0.0, messages: nil, isAddToCartEnable: nil, addToCartButtonText: nil, isInTrolley: nil, isInWishlist: false, purchaseTypes: nil, isFindMeEnable: nil, saleUnitPrice: nil, totalReviewCount: nil, isDeliveryOnly: nil, isDirectFromSupplier: nil)))
    }
}
