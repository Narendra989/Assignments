//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Narendra Satpute on 12/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//

import Foundation

protocol ContentCallback {
    func getAllContents(list:[Content]?)
}

class ContentViewModel {
    var contentList = [Content]()
    var delegate: ContentCallback?
    
    func getAllContent()  {
       
        
        let service = ContentService()
       
        service.fetchAllContents { (response) in
            
            if let respnseObj = response {
                if let list = respnseObj.response {
                    self.contentList = list
                    self.delegate?.getAllContents(list: list)
                }
               
            }
            else {
                self.delegate?.getAllContents(list: nil)
            }
        }
    }
}
