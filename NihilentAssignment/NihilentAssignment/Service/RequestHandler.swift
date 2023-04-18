//
//  RequestHandler.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import Foundation

struct URLConstants {
    static let fetchProductList = "/2f06b453-8375-43cf-861a-06e95a951328"
}


public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

enum RequestType {
    case fetchProductList
}

protocol RequestConvertible {
    func createURLRequest(requestType: RequestType) -> URLRequest
}

class RequestHandler: RequestConvertible {
    
    func createURLRequest(requestType: RequestType) -> URLRequest {
        
        var urlPath: String {
            switch requestType {
            case .fetchProductList:
                return getURLPath(requestType: .fetchProductList)
            }
        }
    
        guard let url = URL(string: urlPath) else {
            fatalError("Invalid request")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = getHttpMethod(requestType: requestType).rawValue
        return urlRequest
    }
    
    private func getHttpMethod(requestType: RequestType) -> HTTPMethod {
        switch requestType {
        case .fetchProductList:
            return .get
        }
    }
    
    private func getURLPath(requestType: RequestType) -> String {
        switch requestType {
        case.fetchProductList:
            return AppConstant.baseURL + URLConstants.fetchProductList
        }
    }
}
