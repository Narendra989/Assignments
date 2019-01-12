//
//  ContentService.swift
//  Assignment
//
//  Created by Narendra Satpute on 12/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ContentService {
    
    //Fetch all contents from server
    
    func fetchAllContents(completionHandler: @escaping (_ response: ApiResponse?) -> Void) -> Void {
     
        NetworkManager.sharedInstance.request(ContentRequestHandler.getContentList()).responseObject { (response: DataResponse<ApiResponse>) in
            
            let statusCode = response.response?.statusCode
            if let result = response.result.value {
                if statusCode == 200 {
                    completionHandler(result)
                    
                }
                else{
                    completionHandler(nil)
                }
            }
        }
        
    }
    
}
