//
//  ContentRequestHandler.swift
//  Assignment
//
//  Created by Narendra Satpute on 12/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//

import Foundation
import Alamofire

enum ContentRequestHandler : URLRequestConvertible {
    
    case getContentList()
}

extension ContentRequestHandler {
    
    var method: HTTPMethod {
        
        switch self {
            
            
        case .getContentList:
            return .get
        }
    }
    
    var path: String {
        
        switch self {
            
        case .getContentList:
            return URLConstants.ContentURL
            
            
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try URLConstants.BaseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            
        case .getContentList():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
            
        }
        
        return urlRequest
    }
}
