//
//  ApiResponse.swift
//  Assignment
//
//  Created by Narendra Satpute on 11/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//


import ObjectMapper

class ApiResponse: Mappable {
    
    var status: Bool?
    var message: String?
    var response: [Content]?
    init() {}
        
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
         if map.mappingType == MappingType.fromJSON {
            status <- map["status"]
            message <- map["message"]
            response <- map["response"]
        }
    }
    
    
}

class Content: Mappable {
    
    var id: Int?
    var userId: Int?
    var message: String?
    var image: String?
    var comment: [Comment]?
    
    init() {}
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        if map.mappingType == MappingType.fromJSON {
            id <- map["id"]
            userId <- map["user_id"]
            message <- map["message"]
            image <- map["image"]
            comment <- map["comments"]
        }
    }
    
    
}


class Comment: Mappable {
    
    var message: String?
    
    init() {}
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        if map.mappingType == MappingType.fromJSON {
            
            message <- map["message"]
            
        }
    }
    
    
}
