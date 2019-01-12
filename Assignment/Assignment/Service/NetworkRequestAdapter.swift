//
//  NetworkRequestAdapter.swift
//  
//
//  Created by Narendra Satpute on 11/01/19.
//

import Foundation

import Alamofire

class NetworkRequestAdapter : RequestAdapter {
    
    private var apiToken: String?
    
    init() {
        apiToken = nil
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        
        var urlRequest = urlRequest
        
        // urlRequest.setValue(HTTPHeaderConstants.MobileIdentifierHeaderValue, forHTTPHeaderField:HTTPHeaderConstants.MobileIdentifierHeaderName)
        
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //TODO :- move hardcoded client type to constants
        urlRequest.setValue("101", forHTTPHeaderField: "clientType")
        setAuthorizationHeader(urlRequest: &urlRequest)
        
        return urlRequest
    }
    
    
    /// This methods sets the authorization header and its value.
    ///
    /// This method checks whether the member variable apiToken has value or not.
    ///
    /// If it has value then it will use it to set header else it will fetch from the LoginData object.
    ///
    /// - Parameter urlRequest: The URL request to adapt.
    
    private func setAuthorizationHeader(urlRequest: inout URLRequest) -> Void {
        
        /* if let token = apiToken, !token.isEmpty {
         urlRequest.setValue(token, forHTTPHeaderField: HTTPHeaderConstants.AuthorizationHeaderName)
         return
         }*/
        
        //if let currentToken = UserDefaults.standard.object(forKey: "token") as! String?
        
        /* if let currentToken = SkyVetLocalStorage.getAuthorizedToken(){
         urlRequest.setValue(currentToken, forHTTPHeaderField: HTTPHeaderConstants.AuthorizationHeaderName)
         }
         
         
         if let deviceToken = SkyVetLocalStorage.getDeviceToken(){
         urlRequest.setValue(deviceToken, forHTTPHeaderField: "deviceId")
         }*/
        
        //        if apiToken ==  currentToken {
        //            urlRequest.setValue(UserDefaults.standard.object(forKey: "token") as! String?, forHTTPHeaderField: HTTPHeaderConstants.AuthorizationHeaderName)
        //
        //            urlRequest.setValue(FlypeLocalStorage.getAuthorizedToken(), forHTTPHeaderField: HTTPHeaderConstants.AuthorizationHeaderName)
        //            return
        //        }
        
        //        if let token = fetchAPIToken() {
        //            apiToken = token
        //            urlRequest.setValue(apiToken!, forHTTPHeaderField: HTTPHeaderConstants.AuthorizationHeaderName)
        //        }
    }
    
    private func fetchAPIToken() -> String? {
        
        /*  guard let loginData: LoginData = FileUtil.loginData() else {
         print("Token is nil")
         return nil
         }
         
         return loginData.token*/
        
        /*  guard let loginData = UserDefaults.standard.object(forKey: "token") else {
         print("Token is nil")
         return nil
         }
         
         return UserDefaults.standard.object(forKey: "token") as! String?*/
        /*
         let token = FlypeLocalStorage.getAuthorizedToken()
         guard let loginData = token else {
         print("Token is nil")
         return nil
         }
         
         return FlypeLocalStorage.getAuthorizedToken()*/
        return ""
    }
}
