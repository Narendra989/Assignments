//
//  FetchProductDataService.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import Foundation
import UIKit

protocol FetchProductDataServiceProtocol {
    func fetchProductData() async -> ProductResponse?
    func loadImage(from imagePath: String) async -> UIImage?
}

class FetchProductDataService: FetchProductDataServiceProtocol {
    
    let noImage = UIImage(named: AppConstant.noImage)!
    
    func fetchProductData() async -> ProductResponse? {
        await withCheckedContinuation { continuation in
            NetworkManager.shared.executeRequest(url: RequestHandler().createURLRequest(requestType: RequestType.fetchProductList)) { (result: Result<ProductResponse, Error>) in
                
                switch result {
                case .success(let data):
                    print("\(data)")
                    continuation.resume(returning: data)
                case .failure(let error):
                    switch error {
                    case HttpErrors.invalidRequest(let error):
                        print("\(error.localizedDescription)")
                        AppMessage.shared.errorMessage = error.localizedDescription
                        continuation.resume(returning: nil)
                    case HttpErrors.invalidResponse:
                        print("\(error.localizedDescription)")
                        AppMessage.shared.errorMessage = error.localizedDescription
                        continuation.resume(returning: nil)
                    default:
                        print("\(error.localizedDescription)")
                        AppMessage.shared.errorMessage = error.localizedDescription
                        continuation.resume(returning: nil)
                    }
                    
                }
            }
        }
    }
    func loadImage(from imagePath: String) async -> UIImage? {
        
        if let image = await retrieveImageFromCache(imagePath: imagePath) {
            return image
        } else {
            let urlRequest = URLRequest(url: URL(string: imagePath)!)
            
            if let imageData = await NetworkManager.shared.loadImage(fromUrl: urlRequest) {
                if let image = UIImage(data: imageData) {
                    await NetworkManager.shared.imageStorage.storeImageInCache(image: image, urlRequest: urlRequest)
                    return image
                } else {
                    await NetworkManager.shared.imageStorage.storeImageInCache(image: noImage, urlRequest: urlRequest)
                    return noImage
                }
            } else {
                await NetworkManager.shared.imageStorage.storeImageInCache(image: noImage, urlRequest: urlRequest)
                return noImage
            }
        }
    }
    
    private func retrieveImageFromCache(imagePath: String) async -> UIImage? {
        let urlRequest = URLRequest(url: URL(string: imagePath)!)
        let image = await NetworkManager.shared.imageStorage.retrieveCachedImage(urlRequest: urlRequest)
        return image
    }
    
}
